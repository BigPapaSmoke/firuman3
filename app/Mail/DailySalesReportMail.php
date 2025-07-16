<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class DailySalesReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $salesData;

    public function __construct($salesData)
    {
        $this->salesData = $salesData;
    }

    public function build()
    {
        return $this->view('emails.daily-sales-report')
                    ->subject('🔥 Firuman Daily Sales Report - ' . $this->salesData['date'])
                    ->with([
                        'salesData' => $this->salesData,
                        'totalSales' => number_format($this->salesData['total_sales'], 2),
                        'totalOrders' => $this->salesData['total_orders'],
                        'averageOrder' => $this->salesData['total_orders'] > 0 
                            ? number_format($this->salesData['total_sales'] / $this->salesData['total_orders'], 2) 
                            : '0.00',
                        'date' => $this->salesData['date']
                    ]);
    }
}