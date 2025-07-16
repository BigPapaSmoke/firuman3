<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Services\SignalService;
use App\Services\SalesReportService;
use Illuminate\Http\Request;
use Carbon\Carbon;

class SignalController extends Controller
{
    protected $signalService;
    protected $salesReportService;

    public function __construct(SignalService $signalService, SalesReportService $salesReportService)
    {
        $this->signalService = $signalService;
        $this->salesReportService = $salesReportService;
    }

    public function sendToAllStands(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:1000'
        ]);

        $results = $this->signalService->sendToAllStands($request->message);

        return response()->json([
            'status' => 'success',
            'message' => 'Messages sent to all configured stands',
            'results' => $results
        ]);
    }

    public function sendSalesUpdate(Request $request)
    {
        $salesData = $this->salesReportService->getDailySalesData(Carbon::today());
        $message = "🔥 Firuman Sales Update\n💰 Today: $" . number_format($salesData['total_sales'], 2) . "\n📦 Orders: " . $salesData['total_orders'];
        
        $results = $this->signalService->sendToAllStands($message);

        return response()->json([
            'status' => 'success',
            'message' => 'Sales updates sent to all stands',
            'results' => $results
        ]);
    }
}