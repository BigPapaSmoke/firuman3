<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class MessageController extends Controller
{
    /**
     * Get messages for the authenticated user
     */
    public function index(Request $request): JsonResponse
    {
        $messages = Message::with(['sender', 'recipient'])
            ->forUser(Auth::id())
            ->orderBy('created_at', 'desc')
            ->paginate(20);

        return response()->json($messages);
    }

    /**
     * Get unread message count
     */
    public function unreadCount(): JsonResponse
    {
        $count = Message::forUser(Auth::id())
            ->unread()
            ->count();

        return response()->json(['count' => $count]);
    }

    /**
     * Send a new message
     */
    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'recipient_id' => 'required|exists:nexopos_users,id',
            'subject' => 'nullable|string|max:255',
            'message' => 'required|string|max:5000',
            'type' => 'in:message,report_request,system',
            'priority' => 'in:low,normal,high,urgent',
            'metadata' => 'nullable|array'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        $message = Message::create([
            'sender_id' => Auth::id(),
            'recipient_id' => $request->recipient_id,
            'subject' => $request->subject,
            'message' => $request->message,
            'type' => $request->type ?? 'message',
            'priority' => $request->priority ?? 'normal',
            'metadata' => $request->metadata
        ]);

        $message->load(['sender', 'recipient']);

        // Create notification for recipient
        $this->createNotificationForMessage($message);

        return response()->json([
            'status' => 'success',
            'message' => 'Message sent successfully',
            'data' => $message
        ]);
    }

    /**
     * Mark message as read
     */
    public function markAsRead(Message $message): JsonResponse
    {
        // Only recipient can mark as read
        if ($message->recipient_id !== Auth::id()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized'
            ], 403);
        }

        $message->markAsRead();

        return response()->json([
            'status' => 'success',
            'message' => 'Message marked as read'
        ]);
    }

    /**
     * Delete a message
     */
    public function destroy(Message $message): JsonResponse
    {
        // Only recipient can delete
        if ($message->recipient_id !== Auth::id()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized'
            ], 403);
        }

        $message->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Message deleted successfully'
        ]);
    }

    /**
     * Get all users for messaging
     */
    public function getUsers(): JsonResponse
    {
        $users = User::where('id', '!=', Auth::id())
            ->where('active', true)
            ->select('id', 'username', 'email')
            ->orderBy('username')
            ->get();

        return response()->json($users);
    }

    /**
     * Send a sales report request
     */
    public function requestSalesReport(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'recipient_id' => 'required|exists:nexopos_users,id',
            'report_type' => 'required|in:daily,weekly,monthly,custom',
            'date_from' => 'nullable|date',
            'date_to' => 'nullable|date|after_or_equal:date_from',
            'message' => 'nullable|string|max:1000'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        $reportType = $request->report_type;
        $customMessage = $request->message ?? "Please send me the {$reportType} sales report.";

        $message = Message::create([
            'sender_id' => Auth::id(),
            'recipient_id' => $request->recipient_id,
            'subject' => "Sales Report Request - " . ucfirst($reportType),
            'message' => $customMessage,
            'type' => 'report_request',
            'priority' => 'normal',
            'metadata' => [
                'report_type' => $reportType,
                'date_from' => $request->date_from,
                'date_to' => $request->date_to
            ]
        ]);

        $message->load(['sender', 'recipient']);
        $this->createNotificationForMessage($message);

        return response()->json([
            'status' => 'success',
            'message' => 'Sales report request sent successfully',
            'data' => $message
        ]);
    }

    /**
     * Create notification for new message
     */
    private function createNotificationForMessage(Message $message): void
    {
        // Integration with existing NexoPOS notification system
        $notification = [
            'title' => $message->type === 'report_request' ? 'Sales Report Request' : 'New Message',
            'description' => $message->subject ?: substr($message->message, 0, 100) . '...',
            'url' => '/dashboard/messages/' . $message->id,
            'user_id' => $message->recipient_id
        ];

        // You would integrate this with the existing notification system
        // For now, we'll create a simple notification record
        \DB::table('nexopos_notifications')->insert([
            'user_id' => $message->recipient_id,
            'title' => $notification['title'],
            'description' => $notification['description'],
            'url' => $notification['url'],
            'created_at' => now(),
            'updated_at' => now()
        ]);
    }
}
