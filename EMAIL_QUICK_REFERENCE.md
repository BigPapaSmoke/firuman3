# Firuman POS - Email Quick Reference

## 🚀 Quick Start Commands

```bash
# Check your current email configuration
php artisan email:check

# Send a test email
php artisan email:test recipient@example.com

# Run the setup script
./setup-email.sh
```

## 📧 Environment Variables Needed

Add these to your `.env` file:

```env
MAIL_MAILER=ses
MAIL_FROM_ADDRESS=noreply@yourdomain.com
MAIL_FROM_NAME="Firuman POS"

AWS_ACCESS_KEY_ID=your_access_key_here
AWS_SECRET_ACCESS_KEY=your_secret_key_here
AWS_DEFAULT_REGION=us-east-1
```

## 🔧 AWS SES Setup Checklist

- [ ] **Request Production Access**
  - Go to AWS SES Console → Account Dashboard
  - Click "Request production access"
  - Fill out the form explaining your POS system use case

- [ ] **Verify Sender Identity**
  - Option A: Verify your domain (recommended)
  - Option B: Verify individual email addresses

- [ ] **Configure DNS Records** (if verifying domain)
  - Add DKIM records to your DNS
  - Add SPF record: `"v=spf1 include:amazonses.com ~all"`

- [ ] **Test Configuration**
  - Run `php artisan email:check`
  - Send test email with `php artisan email:test your@email.com`

## 🚨 Common Issues & Solutions

### "Email address not verified"
- Verify your sender email in AWS SES Console
- Check spam folder for verification email

### "Sending quota exceeded"
- You're still in sandbox mode - request production access
- Or wait for quota reset (24 hours)

### "MessageRejected: Email address not verified"
- In sandbox mode, you can only send to verified addresses
- Add recipient email to verified identities, or get production access

### Emails going to spam
- Set up SPF, DKIM, and DMARC records
- Use a professional sender name and address
- Avoid spam trigger words in subject lines

## 📊 Monitoring

After setup, monitor:
- Bounce rate (keep under 5%)
- Complaint rate (keep under 0.1%)
- Sending statistics in AWS SES Console

## 🔗 Useful Links

- [AWS SES Console](https://console.aws.amazon.com/ses/)
- [Laravel Mail Documentation](https://laravel.com/docs/mail)
- [AWS SES Sending Limits](https://docs.aws.amazon.com/ses/latest/dg/manage-sending-quotas.html)

## 📞 Support

If you need help:
1. Check `SES_PRODUCTION_SETUP.md` for detailed instructions
2. Run `php artisan email:check` to diagnose issues
3. Check Laravel logs: `tail -f storage/logs/laravel.log`
4. AWS SES documentation and support
