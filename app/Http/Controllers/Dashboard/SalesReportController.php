<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Mail\DailySalesReportMail;
use App\Services\SalesReportService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;

class SalesReportController extends Controller
{
    public function sendManualReport(Request $request)
    {
        try {
            $salesReportService = new \App\Services\SalesReportService();
            $date = Carbon::today();
            $salesData = $salesReportService->getDailySalesData($date);
            
            $emails = [
                env('SALES_REPORT_EMAIL_1', 'brotherwadegable@charter.net'),
                env('SALES_REPORT_EMAIL_2', 'mikemccain@ymail.com')
            ];
            
            $emails = array_filter($emails); // Remove empty emails
            
            foreach ($emails as $email) {
                Mail::to($email)->send(new DailySalesReportMail(
                    $salesData, 
                    'manual', 
                    $date->format('M d, Y')
                ));
            }

            return response()->json([
                'status' => 'success',
                'message' => "Sales report sent to: " . implode(', ', $emails),
                'data' => $salesData
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error', 
                'message' => 'Failed to send report: ' . $e->getMessage()
            ], 500);
        }
    }
}