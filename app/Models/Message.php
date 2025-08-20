<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Message extends Model
{
    use HasFactory;

    protected $fillable = [
        'sender_id',
        'recipient_id',
        'subject',
        'message',
        'type',
        'priority',
        'read_at',
        'metadata'
    ];

    protected $casts = [
        'metadata' => 'array',
        'read_at' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the sender of the message
     */
    public function sender(): BelongsTo
    {
        return $this->belongsTo(User::class, 'sender_id');
    }

    /**
     * Get the recipient of the message
     */
    public function recipient(): BelongsTo
    {
        return $this->belongsTo(User::class, 'recipient_id');
    }

    /**
     * Mark message as read
     */
    public function markAsRead(): void
    {
        if (!$this->read_at) {
            $this->update(['read_at' => now()]);
        }
    }

    /**
     * Check if message is unread
     */
    public function isUnread(): bool
    {
        return is_null($this->read_at);
    }

    /**
     * Scope for unread messages
     */
    public function scopeUnread($query)
    {
        return $query->whereNull('read_at');
    }

    /**
     * Scope for messages sent to a specific user
     */
    public function scopeForUser($query, $userId)
    {
        return $query->where('recipient_id', $userId);
    }

    /**
     * Scope for messages sent by a specific user
     */
    public function scopeFromUser($query, $userId)
    {
        return $query->where('sender_id', $userId);
    }

    /**
     * Get priority color for UI
     */
    public function getPriorityColorAttribute(): string
    {
        return match($this->priority) {
            'low' => 'text-gray-500',
            'normal' => 'text-blue-500',
            'high' => 'text-orange-500',
            'urgent' => 'text-red-500',
            default => 'text-blue-500'
        };
    }

    /**
     * Get priority icon for UI
     */
    public function getPriorityIconAttribute(): string
    {
        return match($this->priority) {
            'low' => 'las la-arrow-down',
            'normal' => 'las la-minus',
            'high' => 'las la-arrow-up',
            'urgent' => 'las la-exclamation-triangle',
            default => 'las la-minus'
        };
    }
}
