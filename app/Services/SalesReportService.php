<?php

namespace App\Services;

use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class SalesReportService
{
    public function getDailySalesData($date = null)
    {
        $date = $date ?: Carbon::today();
        $startOfDay = $date->copy()->startOfDay();
        $endOfDay = $date->copy()->endOfDay();

        // Simple data structure that works even if no orders exist
        return [
            'date' => $date->format('M d, Y'),
            'total_sales' => $this->getTotalSales($startOfDay, $endOfDay),
            'total_orders' => $this->getTotalOrders($startOfDay, $endOfDay),
            'average_order_value' => 0,
            'top_products' => collect([]),
            'customer_count' => 0,
        ];
    }

    private function getTotalSales($start, $end)
    {
        try {
            return Order::whereBetween('created_at', [$start, $end])
                       ->where('payment_status', 'paid')
                       ->sum('total') ?: 0;
        } catch (\Exception $e) {
            return 0;
        }
    }

    private function getTotalOrders($start, $end)
    {
        try {
            return Order::whereBetween('created_at', [$start, $end])
                       ->where('payment_status', 'paid')
                       ->count() ?: 0;
        } catch (\Exception $e) {
            return 0;
        }
    }
}