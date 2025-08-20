#!/bin/bash

# =============================================================================
# FIRUMAN POS - EMAIL SETUP SCRIPT
# =============================================================================

echo "🚀 Firuman POS Email Setup Script"
echo "=================================="
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "❌ .env file not found!"
    echo "Please copy .env.example to .env first:"
    echo "cp .env.example .env"
    exit 1
fi

echo "✅ .env file found"
echo ""

# Check current email configuration
echo "📧 Checking current email configuration..."
php artisan email:check
echo ""

# Offer to run test email
echo "🧪 Would you like to send a test email? (y/n)"
read -r send_test

if [ "$send_test" = "y" ] || [ "$send_test" = "Y" ]; then
    echo "Enter email address to send test to:"
    read -r test_email
    
    if [ -n "$test_email" ]; then
        echo "Sending test email to $test_email..."
        php artisan email:test "$test_email"
    else
        echo "❌ No email address provided"
    fi
fi

echo ""
echo "📚 Setup Resources Created:"
echo "• SES_PRODUCTION_SETUP.md - Complete setup guide"
echo "• .env.email.example - Environment configuration template"
echo "• php artisan email:check - Check email configuration"
echo "• php artisan email:test <email> - Send test email"
echo ""

echo "🎯 Next Steps:"
echo "1. Update your .env file with AWS SES credentials"
echo "2. Request production access from AWS SES Console"
echo "3. Verify your sender email/domain in SES Console"
echo "4. Test email sending with: php artisan email:test your@email.com"
echo ""

echo "📖 For detailed instructions, see: SES_PRODUCTION_SETUP.md"
echo ""
echo "✨ Email setup complete!"
