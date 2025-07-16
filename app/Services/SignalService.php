<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class SignalService
{
    protected $apiUrl;
    protected $phoneNumber;
    protected $enabled;

    public function __construct()
    {
        $this->apiUrl = env('SIGNAL_API_URL', 'http://localhost:8080');
        $this->phoneNumber = env('SIGNAL_PHONE_NUMBER');
        $this->enabled = env('SIGNAL_ENABLED', false);
    }

    public function sendMessage($recipientPhone, $message)
    {
        if (!$this->enabled) {
            Log::info("Signal disabled - would send: {$message} to {$recipientPhone}");
            return ['status' => 'disabled', 'message' => 'Signal messaging is disabled'];
        }

        try {
            $response = Http::post($this->apiUrl . '/v2/send', [
                'number' => $this->phoneNumber,
                'recipients' => [$recipientPhone],
                'message' => $message
            ]);

            if ($response->successful()) {
                return ['status' => 'success', 'message' => 'Message sent successfully'];
            }

            return ['status' => 'error', 'message' => 'Failed to send message'];
        } catch (\Exception $e) {
            Log::error('Signal API Error: ' . $e->getMessage());
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    public function sendSalesUpdate($standPhone, $salesData)
    {
        $message = "🔥 Firuman Sales Update\n";
        $message .= "💰 Today's Sales: $" . number_format($salesData['total_sales'], 2) . "\n";
        $message .= "📦 Orders: " . $salesData['total_orders'] . "\n";
        $message .= "⏰ " . now()->format('g:i A M j');

        return $this->sendMessage($standPhone, $message);
    }

    public function sendToAllStands($message)
    {
        $results = [];
        
        for ($i = 1; $i <= 28; $i++) {
            $phoneKey = "STAND_{$i}_PHONE";
            $phone = env($phoneKey);
            
            if ($phone) {
                $results["stand_{$i}"] = $this->sendMessage($phone, $message);
            }
        }

        return $results;
    }

    public function sendInventoryAlert($standPhone, $productName, $quantity)
    {
        $message = "🚨 Firuman Inventory Alert\n";
        $message .= "📦 Product: {$productName}\n";
        $message .= "📊 Quantity: {$quantity} remaining\n";
        $message .= "⚠️ Consider restocking soon";

        return $this->sendMessage($standPhone, $message);
    }
}