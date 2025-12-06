<?php

use Illuminate\Support\Str;

return [

    'driver' => env('SESSION_DRIVER', 'file'),

    'lifetime' => env('SESSION_LIFETIME', 120),

    'expire_on_close' => false,

    'encrypt' => true,

    'files' => storage_path('framework/sessions'),

    'connection' => env('SESSION_CONNECTION', null),

    'table' => 'sessions',

    'store' => env('SESSION_STORE', null),

    'lottery' => [2, 100],

    'cookie' => env(
        'SESSION_COOKIE',
        Str::slug(env('APP_NAME', 'laravel'), '_') . '_session'
    ),

    'path' => '/',

    // Allow all LAN computers to use this session
    'domain' => null,

    // No HTTPS requirement for LAN
    'secure' => false,

    'http_only' => true,

    // Allow cookies from all origins on the LAN
    'same_site' => null,

];
