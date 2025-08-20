<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('sender_id');
            $table->unsignedInteger('recipient_id');
            $table->string('subject')->nullable();
            $table->text('message');
            $table->enum('type', ['message', 'report_request', 'system'])->default('message');
            $table->enum('priority', ['low', 'normal', 'high', 'urgent'])->default('normal');
            $table->timestamp('read_at')->nullable();
            $table->json('metadata')->nullable(); // For storing additional data like report types
            $table->timestamps();

            $table->foreign('sender_id')->references('id')->on('nexopos_users')->onDelete('cascade');
            $table->foreign('recipient_id')->references('id')->on('nexopos_users')->onDelete('cascade');
            
            $table->index(['recipient_id', 'read_at']);
            $table->index(['sender_id', 'created_at']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('messages');
    }
};
