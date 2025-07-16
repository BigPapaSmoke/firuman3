<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Firuman Daily Sales Report</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .header { background: linear-gradient(135deg, #FF4500, #FF6B35); color: white; padding: 20px; text-align: center; }
        .content { padding: 20px; }
        .stats { display: flex; justify-content: space-around; margin: 20px 0; }
        .stat-box { background: #f4f4f4; padding: 15px; border-radius: 8px; text-align: center; min-width: 120px; }
        .stat-value { font-size: 24px; font-weight: bold; color: #FF4500; }
        .stat-label { font-size: 12px; color: #666; text-transform: uppercase; }
        .footer { background: #f8f8f8; padding: 15px; text-align: center; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🔥 Firuman Daily Sales Report</h1>
        <p>{{ $date }}</p>
    </div>
    
    <div class="content">
        <h2>📊 Sales Summary</h2>
        
        <div class="stats">
            <div class="stat-box">
                <div class="stat-value">${{ $totalSales }}</div>
                <div class="stat-label">Total Sales</div>
            </div>
            
            <div class="stat-box">
                <div class="stat-value">{{ $totalOrders }}</div>
                <div class="stat-label">Total Orders</div>
            </div>
            
            <div class="stat-box">
                <div class="stat-value">${{ $averageOrder }}</div>
                <div class="stat-label">Average Order</div>
            </div>
        </div>
        
        @if($totalSales > 0)
            <p>🎉 <strong>Great job today!</strong> Keep up the excellent work!</p>
        @else
            <p>📈 <strong>Ready for tomorrow!</strong> Every day is a new opportunity!</p>
        @endif
        
        <hr style="margin: 30px 0; border: 1px solid #eee;">
        
        <h3>📈 Performance Notes:</h3>
        <ul>
            <li><strong>Date:</strong> {{ $date }}</li>
            <li><strong>Report Time:</strong> {{ now()->format('g:i A') }}</li>
            @if($totalOrders > 0)
                <li><strong>Average per Order:</strong> ${{ $averageOrder }}</li>
            @endif
        </ul>
    </div>
    
    <div class="footer">
        <p>🔥 <strong>Firuman POS</strong> | Automated Sales Report</p>
        <p>This report was automatically generated at {{ now()->format('M j, Y g:i A') }}</p>
    </div>
</body>
</html>