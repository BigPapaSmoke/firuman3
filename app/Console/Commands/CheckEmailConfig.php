<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Config;
use Exception;

class CheckEmailConfig extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'email:check';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check email configuration and SES setup';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('🔍 Checking Firuman POS Email Configuration...');
        $this->newLine();

        // Check mail configuration
        $this->checkMailConfig();
        $this->newLine();

        // Check AWS SES configuration
        $this->checkSESConfig();
        $this->newLine();

        // Check environment variables
        $this->checkEnvironmentVariables();
        $this->newLine();

        // Provide recommendations
        $this->provideRecommendations();

        return Command::SUCCESS;
    }

    private function checkMailConfig()
    {
        $this->info('📧 Mail Configuration:');
        
        $mailConfig = [
            ['Setting', 'Value', 'Status'],
            ['Default Mailer', config('mail.default'), $this->getStatus(config('mail.default') === 'ses')],
            ['From Address', config('mail.from.address'), $this->getStatus(!empty(config('mail.from.address')))],
            ['From Name', config('mail.from.name'), $this->getStatus(!empty(config('mail.from.name')))],
        ];

        $this->table($mailConfig[0], array_slice($mailConfig, 1));
    }

    private function checkSESConfig()
    {
        $this->info('🔧 Amazon SES Configuration:');
        
        $sesConfig = [
            ['Setting', 'Value', 'Status'],
            ['AWS Access Key ID', $this->maskCredential(config('services.ses.key')), $this->getStatus(!empty(config('services.ses.key')))],
            ['AWS Secret Key', $this->maskCredential(config('services.ses.secret')), $this->getStatus(!empty(config('services.ses.secret')))],
            ['AWS Region', config('services.ses.region'), $this->getStatus(!empty(config('services.ses.region')))],
        ];

        $this->table($sesConfig[0], array_slice($sesConfig, 1));
    }

    private function checkEnvironmentVariables()
    {
        $this->info('🌍 Environment Variables:');
        
        $envVars = [
            'MAIL_MAILER',
            'MAIL_FROM_ADDRESS', 
            'MAIL_FROM_NAME',
            'AWS_ACCESS_KEY_ID',
            'AWS_SECRET_ACCESS_KEY',
            'AWS_DEFAULT_REGION'
        ];

        $envStatus = [['Variable', 'Set', 'Status']];
        
        foreach ($envVars as $var) {
            $value = env($var);
            $isSet = !empty($value);
            $envStatus[] = [
                $var,
                $isSet ? '✓' : '✗',
                $this->getStatus($isSet)
            ];
        }

        $this->table($envStatus[0], array_slice($envStatus, 1));
    }

    private function provideRecommendations()
    {
        $this->info('💡 Recommendations:');
        
        $issues = [];
        
        if (config('mail.default') !== 'ses') {
            $issues[] = 'Set MAIL_MAILER=ses in your .env file';
        }
        
        if (empty(config('mail.from.address'))) {
            $issues[] = 'Set MAIL_FROM_ADDRESS in your .env file';
        }
        
        if (empty(config('services.ses.key'))) {
            $issues[] = 'Set AWS_ACCESS_KEY_ID in your .env file';
        }
        
        if (empty(config('services.ses.secret'))) {
            $issues[] = 'Set AWS_SECRET_ACCESS_KEY in your .env file';
        }
        
        if (empty(config('services.ses.region'))) {
            $issues[] = 'Set AWS_DEFAULT_REGION in your .env file (e.g., us-east-1)';
        }

        if (empty($issues)) {
            $this->info('✅ Configuration looks good!');
            $this->info('Next steps:');
            $this->info('1. Request production access from AWS SES if still in sandbox');
            $this->info('2. Verify your sender email address or domain in SES Console');
            $this->info('3. Test email sending with: php artisan email:test your@email.com');
        } else {
            $this->warn('⚠️  Issues found:');
            foreach ($issues as $issue) {
                $this->warn('• ' . $issue);
            }
        }

        $this->newLine();
        $this->info('📚 For detailed setup instructions, see: SES_PRODUCTION_SETUP.md');
    }

    private function getStatus($condition)
    {
        return $condition ? '✅ OK' : '❌ Issue';
    }

    private function maskCredential($credential)
    {
        if (empty($credential)) {
            return 'Not set';
        }
        
        if (strlen($credential) <= 8) {
            return str_repeat('*', strlen($credential));
        }
        
        return substr($credential, 0, 4) . str_repeat('*', strlen($credential) - 8) . substr($credential, -4);
    }
}
