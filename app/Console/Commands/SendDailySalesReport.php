<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Services\SalesReportService;
use App\Mail\DailySalesReportMail;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;

class SendDailySalesReport extends Command
{
    protected $signature = 'sales:send-daily-report';
    protected $description = 'Send daily sales report to configured recipients';

    protected $salesReportService;

    public function __construct(SalesReportService $salesReportService)
    {
        parent::__construct();
        $this->salesReportService = $salesReportService;
    }

    public function handle()
    {
        try {
            $salesData = $this->salesReportService->getDailySalesData(Carbon::today());
            
            $recipients = [
                env('SALES_REPORT_EMAIL_1'),
                env('SALES_REPORT_EMAIL_2'),
                env('SALES_REPORT_EMAIL_3'),
            ];

            $recipients = array_filter($recipients);

            foreach ($recipients as $email) {
                Mail::to($email)->send(new DailySalesReportMail($salesData));
            }

            $this->info('✅ Daily sales report sent successfully to: ' . implode(', ', $recipients));
            
        } catch (\Exception $e) {
            $this->error('❌ Failed to send daily sales report: ' . $e->getMessage());
        }
    }
}