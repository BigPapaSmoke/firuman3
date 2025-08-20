# Amazon SES Production Setup Guide

## Current Status
Your Laravel application is configured for Amazon SES with the following setup:
- Mail driver: SES (configured in config/mail.php)
- AWS credentials: Set via environment variables
- Default region: us-east-1 (configurable)

## Step 1: Request Production Access from AWS

### 1.1 Access AWS SES Console
1. Log into your AWS Console
2. Navigate to Amazon SES service
3. Go to "Account dashboard" in the left sidebar

### 1.2 Check Current Limits
In sandbox mode, you can only:
- Send 200 emails per 24-hour period
- Send emails only to verified email addresses
- Send at a rate of 1 email per second

### 1.3 Request Production Access
1. In the SES console, click "Request production access"
2. Fill out the form with:
   - **Mail type**: Choose "Transactional" (for POS receipts, notifications)
   - **Website URL**: Your Firuman POS website URL
   - **Use case description**: 
     ```
     We are operating a Point of Sale (POS) system called Firuman that needs to send:
     - Order receipts to customers
     - Password reset emails
     - Account notifications
     - System alerts to administrators
     - Customer registration confirmations
     
     We expect to send approximately [X] emails per day to verified customers 
     and system users. All emails are transactional in nature and sent only 
     to users who have explicitly provided their email addresses through our 
     POS system.
     ```
   - **Additional contact addresses**: Add any admin emails that should receive bounces/complaints
   - **Preferred contact language**: English
   - **Acknowledge compliance**: Check all compliance boxes

3. Submit the request

### 1.4 Wait for Approval
- AWS typically responds within 24-48 hours
- You'll receive an email notification about the decision
- If approved, your sending limits will be increased

## Step 2: Configure Your Environment

### 2.1 Environment Variables
Add these to your `.env` file:

```env
# Mail Configuration
MAIL_MAILER=ses
MAIL_FROM_ADDRESS=noreply@yourdomain.com
MAIL_FROM_NAME="Firuman POS"

# AWS SES Configuration
AWS_ACCESS_KEY_ID=your_access_key_here
AWS_SECRET_ACCESS_KEY=your_secret_key_here
AWS_DEFAULT_REGION=us-east-1
AWS_SES_REGION=us-east-1
```

### 2.2 Verify Your Domain (Recommended)
1. In SES Console, go to "Verified identities"
2. Click "Create identity"
3. Choose "Domain" 
4. Enter your domain (e.g., yourdomain.com)
5. Follow DNS verification steps
6. This allows you to send from any email address @yourdomain.com

### 2.3 Alternative: Verify Individual Email Addresses
If you can't verify a domain:
1. Go to "Verified identities"
2. Click "Create identity"
3. Choose "Email address"
4. Enter the email address you want to send from
5. Check the email and click the verification link

## Step 3: Test Email Functionality

### 3.1 Create Test Command
Create a test command to verify email sending:

```bash
php artisan make:command TestEmail
```

### 3.2 Test Email Sending
```bash
php artisan tinker
```

Then run:
```php
Mail::raw('Test email from Firuman POS', function ($message) {
    $message->to('test@example.com')
            ->subject('Test Email');
});
```

## Step 4: Monitor Email Sending

### 4.1 Set Up Bounce and Complaint Handling
1. In SES Console, go to "Configuration sets"
2. Create a configuration set
3. Add event destinations for bounces and complaints
4. Configure SNS topics to handle bounces/complaints

### 4.2 Monitor Sending Statistics
- Check SES Console regularly for sending statistics
- Monitor bounce and complaint rates (keep under 5% and 0.1% respectively)
- Set up CloudWatch alarms for high bounce/complaint rates

## Step 5: Production Best Practices

### 5.1 Email Content Guidelines
- Always include unsubscribe links for marketing emails
- Use clear, professional subject lines
- Include your business address in email footers
- Don't send to purchased email lists

### 5.2 Rate Limiting
- Start with lower sending rates and gradually increase
- Monitor for bounces and complaints
- Implement exponential backoff for failed sends

### 5.3 Security
- Use IAM roles with minimal required permissions
- Rotate AWS access keys regularly
- Monitor AWS CloudTrail for SES API usage

## Troubleshooting

### Common Issues:
1. **"Email address not verified"**: Verify the sender email address in SES Console
2. **"Sending quota exceeded"**: Wait for quota reset or request limit increase
3. **High bounce rate**: Clean your email list, verify email addresses
4. **Emails going to spam**: Set up SPF, DKIM, and DMARC records

### Laravel-Specific Issues:
1. **Queue emails**: Use `Mail::queue()` for better performance
2. **Failed jobs**: Monitor failed job queue for email sending failures
3. **Timeout issues**: Increase timeout in mail configuration

## Next Steps After Approval
1. Update your sending limits in application logic
2. Implement proper error handling for email failures
3. Set up monitoring and alerting
4. Test thoroughly with real email addresses
5. Gradually increase sending volume

## Support
- AWS SES Documentation: https://docs.aws.amazon.com/ses/
- Laravel Mail Documentation: https://laravel.com/docs/mail
- For issues, check AWS Support or Laravel community forums
