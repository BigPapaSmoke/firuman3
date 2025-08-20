<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\Config;
use App\Mail\DailySalesReportMail;
use App\Mail\TestMail;
use App\Services\SalesReportService;
use Carbon\Carbon;

class TestEmail extends Command
{
    protected $signature = 'email:test 
                            {email? : Email address to send test to}
                            {--type=basic : Type of test (basic|html|markdown|raw|sales-report|all)}
                            {--queue : Test queued email sending}
                            {--batch=1 : Number of test emails to send}
                            {--interactive : Interactive mode for email input}
                            {--config : Show detailed configuration}
                            {--diagnose : Run comprehensive diagnostics}
                            {--preview : Preview email without sending}';
    
    protected $description = 'Comprehensive email testing tool for Firuman POS';

    private $startTime;
    private $testResults = [];

    public function handle()
    {
        $this->startTime = microtime(true);
        
        $this->displayHeader();
        
        // Handle different modes
        if ($this->option('config')) {
            return $this->showConfiguration();
        }
        
        if ($this->option('diagnose')) {
            return $this->runDiagnostics();
        }
        
        // Get email address
        $email = $this->getEmailAddress();
        if (!$email) {
            return 1;
        }
        
        // Validate email
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $this->error('❌ Invalid email address: ' . $email);
            return 1;
        }
        
        $this->info("📧 Testing email functionality for: {$email}");
        $this->newLine();
        
        // Run tests based on type
        $testType = $this->option('type');
        $batch = (int) $this->option('batch');
        
        if ($testType === 'all') {
            $this->runAllTests($email, $batch);
        } else {
            $this->runSpecificTest($email, $testType, $batch);
        }
        
        $this->displayResults();
        
        return 0;
    }
    
    private function displayHeader()
    {
        $this->info('🔥 ================================');
        $this->info('🔥  FIRUMAN POS EMAIL TESTER');
        $this->info('🔥 ================================');
        $this->newLine();
    }
    
    private function getEmailAddress()
    {
        $email = $this->argument('email');
        
        if ($this->option('interactive') || !$email) {
            $email = $this->ask('📧 Enter email address for testing', $email ?: 'test@example.com');
        }
        
        return $email;
    }
    
    private function showConfiguration()
    {
        $this->info('📋 EMAIL CONFIGURATION');
        $this->info('========================');
        
        $config = [
            'Default Driver' => config('mail.default'),
            'From Address' => config('mail.from.address'),
            'From Name' => config('mail.from.name'),
            'SMTP Host' => config('mail.mailers.smtp.host'),
            'SMTP Port' => config('mail.mailers.smtp.port'),
            'SMTP Encryption' => config('mail.mailers.smtp.encryption'),
            'SMTP Username' => config('mail.mailers.smtp.username') ? '***SET***' : 'NOT SET',
            'SMTP Password' => config('mail.mailers.smtp.password') ? '***SET***' : 'NOT SET',
            'AWS SES Region' => config('services.ses.region', 'Not configured'),
            'Queue Driver' => config('queue.default'),
            'Environment' => app()->environment(),
        ];
        
        foreach ($config as $key => $value) {
            $status = $value === 'NOT SET' ? '❌' : '✅';
            $this->line("{$status} {$key}: {$value}");
        }
        
        $this->newLine();
        $this->info('💡 Use --diagnose for detailed connection testing');
    }
    
    private function runDiagnostics()
    {
        $this->info('🔍 RUNNING EMAIL DIAGNOSTICS');
        $this->info('==============================');
        
        // Test 1: Configuration Check
        $this->info('1️⃣ Checking configuration...');
        $configIssues = $this->checkConfiguration();
        
        if (empty($configIssues)) {
            $this->info('   ✅ Configuration looks good');
        } else {
            $this->warn('   ⚠️  Configuration issues found:');
            foreach ($configIssues as $issue) {
                $this->line("      • {$issue}");
            }
        }
        
        // Test 2: Driver Availability
        $this->info('2️⃣ Checking mail driver availability...');
        $this->checkDriverAvailability();
        
        // Test 3: Queue System
        $this->info('3️⃣ Checking queue system...');
        $this->checkQueueSystem();
        
        // Test 4: Template Compilation
        $this->info('4️⃣ Testing template compilation...');
        $this->testTemplateCompilation();
        
        $this->newLine();
        $this->info('🎯 Diagnostics complete! Use email:test to send actual test emails.');
    }
    
    private function checkConfiguration()
    {
        $issues = [];
        
        if (!config('mail.from.address') || config('mail.from.address') === 'hello@example.com') {
            $issues[] = 'MAIL_FROM_ADDRESS not properly configured';
        }
        
        if (!config('mail.from.name') || config('mail.from.name') === 'Example') {
            $issues[] = 'MAIL_FROM_NAME not properly configured';
        }
        
        $driver = config('mail.default');
        if ($driver === 'smtp') {
            if (!config('mail.mailers.smtp.host')) {
                $issues[] = 'SMTP host not configured';
            }
            if (!config('mail.mailers.smtp.username')) {
                $issues[] = 'SMTP username not configured';
            }
            if (!config('mail.mailers.smtp.password')) {
                $issues[] = 'SMTP password not configured';
            }
        }
        
        return $issues;
    }
    
    private function checkDriverAvailability()
    {
        $driver = config('mail.default');
        
        try {
            $mailer = Mail::mailer($driver);
            $this->info("   ✅ Driver '{$driver}' is available");
            
            // Additional checks for specific drivers
            if ($driver === 'ses') {
                if (!config('services.ses.key') || !config('services.ses.secret')) {
                    $this->warn('   ⚠️  AWS SES credentials not configured');
                }
            }
            
        } catch (\Exception $e) {
            $this->error("   ❌ Driver '{$driver}' error: " . $e->getMessage());
        }
    }
    
    private function checkQueueSystem()
    {
        $queueDriver = config('queue.default');
        
        if ($queueDriver === 'sync') {
            $this->warn('   ⚠️  Queue driver is set to "sync" - emails will be sent synchronously');
        } else {
            $this->info("   ✅ Queue driver: {$queueDriver}");
            
            try {
                // Test queue connection
                Queue::size();
                $this->info('   ✅ Queue system is accessible');
            } catch (\Exception $e) {
                $this->error('   ❌ Queue system error: ' . $e->getMessage());
            }
        }
    }
    
    private function testTemplateCompilation()
    {
        try {
            // Test basic template compilation
            view('emails.test-email', [
                'testData' => [
                    'timestamp' => now()->format('Y-m-d H:i:s'),
                    'server' => 'localhost',
                    'environment' => app()->environment(),
                    'php_version' => PHP_VERSION,
                    'laravel_version' => app()->version(),
                ],
                'testType' => 'basic'
            ])->render();
            
            $this->info('   ✅ HTML template compiles successfully');
            
            // Test markdown template
            view('emails.test-email-markdown', [
                'testData' => [
                    'timestamp' => now()->format('Y-m-d H:i:s'),
                    'server' => 'localhost',
                    'environment' => app()->environment(),
                    'php_version' => PHP_VERSION,
                    'laravel_version' => app()->version(),
                ],
                'testType' => 'markdown'
            ])->render();
            
            $this->info('   ✅ Markdown template compiles successfully');
            
        } catch (\Exception $e) {
            $this->error('   ❌ Template compilation error: ' . $e->getMessage());
        }
    }
    
    private function runAllTests($email, $batch)
    {
        $tests = ['raw', 'basic', 'html', 'markdown', 'sales-report'];
        
        foreach ($tests as $test) {
            $this->runSpecificTest($email, $test, 1);
            $this->newLine();
        }
        
        if ($this->option('queue')) {
            $this->info('🔄 Testing queued email...');
            $this->runSpecificTest($email, 'basic', 1, true);
        }
    }
    
    private function runSpecificTest($email, $type, $batch = 1, $queued = false)
    {
        $queued = $queued || $this->option('queue');
        
        $this->info("📤 Testing {$type} email" . ($queued ? ' (queued)' : '') . "...");
        
        if ($this->option('preview')) {
            return $this->previewEmail($type);
        }
        
        $startTime = microtime(true);
        $success = 0;
        $errors = [];
        
        for ($i = 1; $i <= $batch; $i++) {
            try {
                if ($batch > 1) {
                    $this->line("   Sending email {$i}/{$batch}...");
                }
                
                $this->sendTestEmail($email, $type, $queued);
                $success++;
                
            } catch (\Exception $e) {
                $errors[] = $e->getMessage();
                $this->error("   ❌ Email {$i} failed: " . $e->getMessage());
            }
        }
        
        $duration = round((microtime(true) - $startTime) * 1000, 2);
        
        $this->testResults[] = [
            'type' => $type,
            'queued' => $queued,
            'batch' => $batch,
            'success' => $success,
            'errors' => count($errors),
            'duration' => $duration
        ];
        
        if ($success === $batch) {
            $this->info("   ✅ {$success}/{$batch} emails sent successfully ({$duration}ms)");
        } else {
            $this->warn("   ⚠️  {$success}/{$batch} emails sent successfully ({$duration}ms)");
        }
        
        // Show additional info for specific tests
        if ($type === 'sales-report' && $success > 0) {
            $salesReportService = new SalesReportService();
            $salesData = $salesReportService->getDailySalesData(Carbon::today());
            $this->info("   📊 Sales Data: $" . number_format($salesData['total_sales'], 2) . 
                       " from " . $salesData['total_orders'] . " orders");
        }
    }
    
    private function sendTestEmail($email, $type, $queued = false)
    {
        switch ($type) {
            case 'raw':
                $mail = Mail::raw('🔥 This is a raw test email from Firuman POS system.', function ($message) use ($email) {
                    $message->to($email)->subject('🔥 Firuman POS - Raw Test Email');
                });
                break;
                
            case 'basic':
            case 'html':
                $testMail = new TestMail(['test_id' => uniqid()], $type);
                $mail = Mail::to($email);
                if ($queued) {
                    $mail->queue($testMail);
                } else {
                    $mail->send($testMail);
                }
                break;
                
            case 'markdown':
                $testMail = new TestMail(['test_id' => uniqid()], 'markdown');
                $mail = Mail::to($email);
                if ($queued) {
                    $mail->queue($testMail);
                } else {
                    $mail->send($testMail);
                }
                break;
                
            case 'sales-report':
                $salesReportService = new SalesReportService();
                $date = Carbon::today();
                $salesData = $salesReportService->getDailySalesData($date);
                
                $reportMail = new DailySalesReportMail($salesData, 'manual', $date->format('M d, Y'));
                $mail = Mail::to($email);
                if ($queued) {
                    $mail->queue($reportMail);
                } else {
                    $mail->send($reportMail);
                }
                break;
                
            default:
                throw new \InvalidArgumentException("Unknown test type: {$type}");
        }
    }
    
    private function previewEmail($type)
    {
        $this->info("👀 PREVIEWING {$type} EMAIL");
        $this->info('========================');
        
        try {
            switch ($type) {
                case 'raw':
                    $this->line('Subject: 🔥 Firuman POS - Raw Test Email');
                    $this->line('Body: 🔥 This is a raw test email from Firuman POS system.');
                    break;
                    
                case 'basic':
                case 'html':
                    $testMail = new TestMail(['test_id' => 'preview'], $type);
                    $rendered = $testMail->render();
                    $this->line('Subject: ' . $testMail->build()->subject);
                    $this->line('Template: emails.test-email');
                    $this->line('Content: HTML email with system information');
                    break;
                    
                case 'markdown':
                    $testMail = new TestMail(['test_id' => 'preview'], 'markdown');
                    $this->line('Subject: ' . $testMail->build()->subject);
                    $this->line('Template: emails.test-email-markdown');
                    $this->line('Content: Markdown email with system information');
                    break;
                    
                case 'sales-report':
                    $salesReportService = new SalesReportService();
                    $salesData = $salesReportService->getDailySalesData(Carbon::today());
                    $reportMail = new DailySalesReportMail($salesData, 'manual', Carbon::today()->format('M d, Y'));
                    $this->line('Subject: ' . $reportMail->build()->subject);
                    $this->line('Template: emails.daily-sales-report');
                    $this->line('Sales Data: $' . number_format($salesData['total_sales'], 2) . 
                               ' from ' . $salesData['total_orders'] . ' orders');
                    break;
            }
            
            $this->newLine();
            $this->info('💡 Remove --preview flag to actually send the email');
            
        } catch (\Exception $e) {
            $this->error('❌ Preview failed: ' . $e->getMessage());
        }
    }
    
    private function displayResults()
    {
        if (empty($this->testResults)) {
            return;
        }
        
        $this->newLine();
        $this->info('📊 TEST RESULTS SUMMARY');
        $this->info('========================');
        
        $totalSuccess = 0;
        $totalErrors = 0;
        $totalDuration = 0;
        
        foreach ($this->testResults as $result) {
            $status = $result['success'] === $result['batch'] ? '✅' : '⚠️';
            $queuedText = $result['queued'] ? ' (queued)' : '';
            
            $this->line("{$status} {$result['type']}{$queuedText}: {$result['success']}/{$result['batch']} sent ({$result['duration']}ms)");
            
            $totalSuccess += $result['success'];
            $totalErrors += $result['errors'];
            $totalDuration += $result['duration'];
        }
        
        $this->newLine();
        $overallDuration = round((microtime(true) - $this->startTime) * 1000, 2);
        
        $this->info("🎯 Overall: {$totalSuccess} successful, {$totalErrors} errors");
        $this->info("⏱️  Total time: {$overallDuration}ms");
        
        if ($totalErrors === 0) {
            $this->info('🎉 All tests passed! Your email system is working perfectly.');
        } else {
            $this->warn('⚠️  Some tests failed. Use --diagnose for troubleshooting.');
        }
        
        $this->newLine();
        $this->info('💡 Available options:');
        $this->line('   --type=all          Test all email types');
        $this->line('   --queue             Test queued emails');
        $this->line('   --batch=5           Send multiple test emails');
        $this->line('   --interactive       Interactive email input');
        $this->line('   --config            Show configuration');
        $this->line('   --diagnose          Run diagnostics');
        $this->line('   --preview           Preview without sending');
    }
}
