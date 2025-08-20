<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Firuman POS Email Test</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            line-height: 1.6; 
            color: #333; 
            margin: 0; 
            padding: 0; 
            background-color: #f4f4f4; 
        }
        .container { 
            max-width: 600px; 
            margin: 20px auto; 
            background: white; 
            border-radius: 10px; 
            overflow: hidden; 
            box-shadow: 0 4px 6px rgba(0,0,0,0.1); 
        }
        .header { 
            background: linear-gradient(135deg, #FF4500, #FF6B35); 
            color: white; 
            padding: 30px 20px; 
            text-align: center; 
        }
        .header h1 { 
            margin: 0; 
            font-size: 28px; 
            font-weight: bold; 
        }
        .header p { 
            margin: 10px 0 0 0; 
            opacity: 0.9; 
        }
        .content { 
            padding: 30px 20px; 
        }
        .test-info { 
            background: #f8f9fa; 
            border-left: 4px solid #FF4500; 
            padding: 15px; 
            margin: 20px 0; 
            border-radius: 0 5px 5px 0; 
        }
        .test-info h3 { 
            margin: 0 0 10px 0; 
            color: #FF4500; 
        }
        .info-grid { 
            display: grid; 
            grid-template-columns: 1fr 1fr; 
            gap: 10px; 
            margin: 15px 0; 
        }
        .info-item { 
            background: #fff; 
            padding: 10px; 
            border-radius: 5px; 
            border: 1px solid #e9ecef; 
        }
        .info-label { 
            font-weight: bold; 
            color: #666; 
            font-size: 12px; 
            text-transform: uppercase; 
        }
        .info-value { 
            color: #333; 
            font-size: 14px; 
            margin-top: 2px; 
        }
        .success-message { 
            background: #d4edda; 
            color: #155724; 
            padding: 15px; 
            border-radius: 5px; 
            border: 1px solid #c3e6cb; 
            margin: 20px 0; 
            text-align: center; 
        }
        .footer { 
            background: #f8f8f8; 
            padding: 20px; 
            text-align: center; 
            font-size: 12px; 
            color: #666; 
            border-top: 1px solid #e9ecef; 
        }
        .badge { 
            display: inline-block; 
            padding: 4px 8px; 
            background: #FF4500; 
            color: white; 
            border-radius: 12px; 
            font-size: 11px; 
            font-weight: bold; 
            text-transform: uppercase; 
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔥 Firuman POS</h1>
            <p>Email System Test - {{ ucfirst($testType) }} <span class="badge">{{ $testData['environment'] }}</span></p>
        </div>
        
        <div class="content">
            <div class="success-message">
                <strong>✅ Email Test Successful!</strong><br>
                Your email configuration is working correctly.
            </div>
            
            <div class="test-info">
                <h3>📊 Test Information</h3>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Test Type</div>
                        <div class="info-value">{{ ucfirst($testType) }} Email</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Timestamp</div>
                        <div class="info-value">{{ $testData['timestamp'] }}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Server</div>
                        <div class="info-value">{{ $testData['server'] }}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Environment</div>
                        <div class="info-value">{{ $testData['environment'] }}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">PHP Version</div>
                        <div class="info-value">{{ $testData['php_version'] }}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Laravel Version</div>
                        <div class="info-value">{{ $testData['laravel_version'] }}</div>
                    </div>
                </div>
            </div>
            
            <h3>🎯 What This Test Validates:</h3>
            <ul>
                <li>✅ Email driver configuration</li>
                <li>✅ SMTP/SES connection</li>
                <li>✅ Authentication credentials</li>
                <li>✅ HTML email rendering</li>
                <li>✅ Template compilation</li>
                @if($testType === 'queue')
                <li>✅ Queue system integration</li>
                @endif
            </ul>
            
            <p><strong>🚀 Next Steps:</strong></p>
            <ul>
                <li>Test different email types using: <code>php artisan email:test --type=html</code></li>
                <li>Test sales reports: <code>php artisan email:test --sales-report</code></li>
                <li>Test queue functionality: <code>php artisan email:test --queue</code></li>
            </ul>
        </div>
        
        <div class="footer">
            <p><strong>🔥 Firuman POS</strong> | Email System Test</p>
            <p>Generated automatically by Laravel Email Testing Command</p>
        </div>
    </div>
</body>
</html>
