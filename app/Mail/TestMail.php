<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TestMail extends Mailable
{
    use Queueable, SerializesModels;

    public $testData;
    public $testType;

    public function __construct($testData = [], $testType = 'basic')
    {
        $this->testData = array_merge([
            'timestamp' => now()->format('Y-m-d H:i:s'),
            'server' => request()->getHost() ?? 'localhost',
            'environment' => app()->environment(),
            'php_version' => PHP_VERSION,
            'laravel_version' => app()->version(),
        ], $testData);
        
        $this->testType = $testType;
    }

    public function build()
    {
        $subject = match($this->testType) {
            'html' => '🔥 Firuman POS - HTML Email Test',
            'markdown' => '📝 Firuman POS - Markdown Email Test',
            'attachment' => '📎 Firuman POS - Attachment Email Test',
            'queue' => '⚡ Firuman POS - Queue Email Test',
            default => '✅ Firuman POS - Basic Email Test'
        };

        $mail = $this->subject($subject)
                    ->with([
                        'testData' => $this->testData,
                        'testType' => $this->testType
                    ]);

        if ($this->testType === 'markdown') {
            return $mail->markdown('emails.test-email-markdown');
        }

        return $mail->view('emails.test-email');
    }
}
