<?php

use App\Http\Controllers\MessageController;
use Illuminate\Support\Facades\Route;

Route::prefix('messages')->group(function () {
    // Get all messages for the authenticated user
    Route::get('/', [MessageController::class, 'index']);
    
    // Get unread message count
    Route::get('/unread-count', [MessageController::class, 'unreadCount']);
    
    // Get list of users for messaging
    Route::get('/users', [MessageController::class, 'getUsers']);
    
    // Send a new message
    Route::post('/', [MessageController::class, 'store']);
    
    // Send a report request
    Route::post('/report-request', [MessageController::class, 'sendReportRequest']);
    
    // Mark message as read
    Route::put('/{message}/read', [MessageController::class, 'markAsRead']);
    
    // Delete a message
    Route::delete('/{message}', [MessageController::class, 'destroy']);
    
    // Get a specific message
    Route::get('/{message}', [MessageController::class, 'show']);
});
