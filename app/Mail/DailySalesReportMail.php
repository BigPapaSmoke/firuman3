<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class DailySalesReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $salesData;
    public $reportType;
    public $reportDate;

    public function __construct($salesData, $reportType = 'automatic', $reportDate = null)
    {
        $this->salesData = $salesData;
        $this->reportType = $reportType;
        $this->reportDate = $reportDate ?: $salesData['date'];
    }

    public function build()
    {
        $subjectPrefix = $this->reportType === 'manual' ? '📊 Manual' : '🔥 Firuman';
        
        return $this->view('emails.daily-sales-report')
                    ->subject($subjectPrefix . ' Daily Sales Report - ' . $this->reportDate)
                    ->with([
                        'salesData' => $this->salesData,
                        'totalSales' => number_format($this->salesData['total_sales'], 2),
                        'totalOrders' => $this->salesData['total_orders'],
                        'averageOrder' => $this->salesData['total_orders'] > 0 
                            ? number_format($this->salesData['total_sales'] / $this->salesData['total_orders'], 2) 
                            : '0.00',
                        'date' => $this->reportDate,
                        'reportType' => $this->reportType
                    ]);
    }
}