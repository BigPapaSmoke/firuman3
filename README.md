# Firuman POS System

<div align="center">
  <img src="public/svg/firuman-variant-1.svg" alt="Firuman Logo" width="128">
  <h3>No Bloat. No Noise. Just Firuman.</h3>
  <p>A powerful, modern Point of Sale system built on Laravel</p>
</div>

## About Firuman

Firuman is a comprehensive Point of Sale (POS) system designed for modern businesses. Built on the robust Laravel framework with a Vue.js frontend, Firuman provides a seamless experience for managing sales, inventory, customers, and business operations. This system focuses on utilities and functionalities to offer businesses all the tools they need to manage their store efficiently.

## Features

- 🛒 **Point of Sale Interface** - Intuitive POS system for quick transactions
- 📊 **Inventory Management** - Track products, stock levels, and variations
- 👥 **Customer Management** - Maintain customer records and purchase history
- 📈 **Sales Analytics** - Comprehensive reporting and business insights
- 🏪 **Multi-store Support** - Manage multiple locations from one system
- 💳 **Payment Processing** - Support for various payment methods
- 🎨 **Modern UI** - Clean, responsive interface built with TailwindCSS
- 🔐 **Secure Authentication** - Role-based access control with Laravel Sanctum
- 🌐 **API Ready** - RESTful API for integrations and mobile apps
- 📱 **Responsive Design** - Works seamlessly on smartphones, tablets, and desktops

## Technology Stack

- **Backend**: Laravel 11 (PHP 8.2+)
- **Frontend**: Vue.js 3 with TypeScript
- **Database**: MySQL
- **Styling**: TailwindCSS
- **Build Tool**: Vite
- **Authentication**: Laravel Sanctum

## Requirements

- PHP 8.2 or higher
- MySQL 5.7+ or MariaDB 10.3+
- Composer
- Node.js 18+ and npm
- Web server (Apache/Nginx)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/BigPapaSmoke/firuman3.git
   cd firuman3
   ```

2. **Install PHP dependencies**
   ```bash
   composer install
   ```

3. **Install Node.js dependencies**
   ```bash
   npm install
   ```

4. **Environment setup**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

5. **Configure your database**
   Edit `.env` file with your database credentials:
   ```env
   APP_NAME="Firuman"
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=your_database_name
   DB_USERNAME=your_username
   DB_PASSWORD=your_password
   ```

6. **Run database migrations**
   ```bash
   php artisan migrate
   ```

7. **Seed the database (optional)**
   ```bash
   php artisan db:seed
   ```

8. **Create storage symlink**
   ```bash
   php artisan storage:link
   ```

9. **Build frontend assets**
   ```bash
   npm run build
   ```

10. **Start the development server**
    ```bash
    php artisan serve
    ```

Visit `http://127.0.0.1:8000` to access your Firuman installation.

## Development

### Frontend Development
For frontend development with hot reload:
```bash
npm run dev
```

For TailwindCSS development:
```bash
npm run css-watch
```

### Running Tests
```bash
php artisan test
```

### Code Style
Format code using Laravel Pint:
```bash
./vendor/bin/pint
```

## API Documentation

Firuman provides a comprehensive RESTful API for integrations. API endpoints are available under `/api/nexopos/v4/`.

### Authentication
Use Laravel Sanctum personal access tokens for API authentication. Generate tokens from the dashboard under the API tab.

## Configuration

### Environment Variables
Key configuration options in `.env`:

- `APP_NAME` - Application name (Firuman)
- `APP_URL` - Your application URL
- `DB_*` - Database configuration
- `MAIL_*` - Email configuration
- `SESSION_COOKIE` - Session cookie name (firuman_session)

### Modules
Firuman supports a modular architecture. Custom modules can be placed in the `modules/` directory.


## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Contribution Guidelines
Do you plan to contribute? That's awesome. We don't have that many developers on it, so we're open to any type of contributions. If you're a developer, you'll start by forking the project and deploying that locally for further tests. 

To build the project for development:

**To install Node.js dependencies**
```bash
npm install
```

**To watch the Vue component changes (Vue.js)**
```bash
npm run dev
```

**To watch the project changes (TailwindCSS)**
```bash
npm run css-watch
```

**To build the project for production:**
```bash
npm run prod
```

## Troubleshooting

### CSRF Error After Installation
If you encounter CSRF errors after installation, make sure your website URL is correctly set in the `.env` file. The `APP_URL` must match your actual domain.

### Error After Database Setup (using `php artisan serve`)
If you're using `php artisan serve` and encounter infinite loading after database setup, simply refresh the page. This happens because Laravel restarts the development server when the `.env` file is updated.

## Security

If you discover any security vulnerabilities, please create an issue on GitHub or contact the maintainers directly.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built on the foundation of NexoPOS
- Laravel community for the amazing framework
- Vue.js team for the reactive frontend framework
- TailwindCSS for the utility-first CSS framework

## Screenshots

### POS Interface
The POS is designed to provide everything the cashier needs to process orders quickly and easily with the Firuman branding.

### Dashboard
Firuman includes a responsive and beautiful dashboard that works seamlessly on smartphones, tablets, and desktops.

### Products Management
Manage your inventory with an intuitive interface for adding and editing products.

### Orders Management
Every saved sale is listed with options for receipts, refunds, and payment processing.

---

<div align="center">
© 2025 Firuman. All rights reserved.  

💡 *Built on the shoulders of giants:* [NexoPOS](https://nexopos.com)
</div>
