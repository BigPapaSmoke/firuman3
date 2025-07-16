<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        // Send sales reports at 6:00 PM and 3:00 AM
        $schedule->command('sales:send-daily-report')
            ->dailyAt('18:00') // 6:00 PM
            ->timezone('America/New_York'); // Adjust to your timezone

        $schedule->command('sales:send-daily-report')
            ->dailyAt('03:00') // 3:00 AM
            ->timezone('America/New_York'); // Adjust to your timezone
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}