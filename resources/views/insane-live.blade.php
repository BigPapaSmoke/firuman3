<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>🔥 Firuman Live Sales Dashboard - 20 Stores</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Arial', sans-serif; 
            background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
            color: white; 
            padding: 20px;
            min-height: 100vh;
        }
        .header { text-align: center; margin-bottom: 30px; }
        .header h1 { font-size: 2.5em; color: #FF4500; margin-bottom: 10px; }
        .summary { display: flex; justify-content: center; gap: 40px; margin-bottom: 40px; flex-wrap: wrap; }
        .summary-card { 
            background: rgba(255,69,0,0.1); 
            border: 2px solid #FF4500; 
            border-radius: 10px; 
            padding: 20px; 
            text-align: center; 
            min-width: 150px;
        }
        .summary-value { font-size: 2em; font-weight: bold; color: #FF4500; }
        .summary-label { font-size: 0.9em; color: #ccc; margin-top: 5px; }
        .stores-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); 
            gap: 20px; 
            max-width: 1600px; 
            margin: 0 auto;
        }
        .store-card { 
            background: rgba(255,255,255,0.05); 
            border: 1px solid rgba(255,69,0,0.3); 
            border-radius: 8px; 
            padding: 20px; 
            transition: all 0.3s ease;
        }
        .store-card:hover { 
            border-color: #FF4500; 
            background: rgba(255,69,0,0.1); 
            transform: translateY(-2px);
        }
        .store-name { font-size: 1.2em; font-weight: bold; margin-bottom: 10px; color: #fff; }
        .store-sales { font-size: 1.8em; color: #FF4500; font-weight: bold; }
        .store-orders { font-size: 0.9em; color: #ccc; margin-top: 5px; }
        .footer { 
            text-align: center; 
            margin-top: 40px; 
            padding-top: 20px; 
            border-top: 1px solid rgba(255,69,0,0.3);
            font-size: 0.9em;
            color: #ccc;
        }
        .loading { text-align: center; font-size: 1.2em; color: #FF4500; }
        .error { text-align: center; color: #ff6b6b; background: rgba(255,107,107,0.1); padding: 20px; border-radius: 8px; }
        @keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.7; } }
        .updating { animation: pulse 1s infinite; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🔥 Firuman Live Sales Dashboard</h1>
        <h2 style="color: #ccc; font-size: 1.2em;">20 Store Network</h2>
        <p id="current-date">{{ now()->format('l, F j, Y') }}</p>
        <p id="last-updated">Loading...</p>
    </div>

    <div id="dashboard-content">
        <div class="loading">📊 Loading live sales data for 20 stores...</div>
    </div>

    <div class="footer">
        <p>🔥 <strong>Firuman POS</strong> | Real-time Multi-Location Dashboard</p>
        <p>Auto-refreshes every 30 seconds | 20 Store Network</p>
    </div>

    <script>
        let updateInterval;

        async function loadDashboard() {
            const content = document.getElementById('dashboard-content');
            content.classList.add('updating');

            try {
                const response = await fetch('/api/messages/live-sales-dashboard/20', {
                    headers: {
                        'Accept': 'application/json'
                    }
                });

                if (!response.ok) throw new Error('Failed to fetch dashboard data');
                
                const data = await response.json();
                renderDashboard(data);
                
                document.getElementById('last-updated').innerHTML = 
                    `📍 Last updated: ${data.last_updated}`;
                    
            } catch (error) {
                content.innerHTML = `
                    <div class="error">
                        <h3>❌ Unable to load dashboard data</h3>
                        <p>${error.message}</p>
                        <p>Retrying in 30 seconds...</p>
                    </div>
                `;
            } finally {
                content.classList.remove('updating');
            }
        }

        function renderDashboard(data) {
            const content = document.getElementById('dashboard-content');
            
const summaryHTML = `
    <div class="summary">
        <div class="summary-card">
            <div class="summary-value">$${formatNumber(data.summary.total_sales)}</div>
            <div class="summary-label">Total Sales</div>
        </div>
        <div class="summary-card">
            <div class="summary-value">${data.summary.total_orders}</div>
            <div class="summary-label">Total Orders</div>
        </div>
        <div class="summary-card">
            <div class="summary-value">$${formatNumber(data.summary.average_ticket)}</div>
            <div class="summary-label">Avg Ticket</div>
        </div>
        <div class="summary-card">
            <div class="summary-value">${data.summary.store_count}</div>
            <div class="summary-label">Active Stores</div>
        </div>
        <div class="summary-card">
            <div class="summary-value">$${formatNumber(data.summary.average_per_store)}</div>
            <div class="summary-label">Avg per Store</div>
        </div>
    </div>
`;
            const storesHTML = `
                <div class="stores-grid">
                    ${data.stores.map(store => `
                        <div class="store-card">
                            <div class="store-name">${store.store_name}</div>
                            <div class="store-sales">$${formatNumber(store.total_sales)}</div>
                            <div class="store-orders">${store.order_count} orders today</div>
                        </div>
                    `).join('')}
                </div>
            `;

            content.innerHTML = summaryHTML + storesHTML;
        }

        function formatNumber(num) {
            return parseFloat(num).toLocaleString('en-US', {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
        }

        // Auto-refresh every 30 seconds
        function startAutoRefresh() {
            loadDashboard(); // Load immediately
            updateInterval = setInterval(loadDashboard, 30000); // Then every 30 seconds
        }

        // Start when page loads
        document.addEventListener('DOMContentLoaded', startAutoRefresh);

        // Handle page visibility (pause when hidden, resume when visible)
        document.addEventListener('visibilitychange', function() {
            if (document.hidden) {
                clearInterval(updateInterval);
            } else {
                startAutoRefresh();
            }
        });
    </script>
</body>
</html>