ActionMailer::Base.smtp_settings = {
  port:           587,
  address:        'smtp.mailgun.org',
  user_name:      ENV['MAILGUN_SMTP_LOGIN'],
  domain:         'appcf21cb53414344b68769ff28c95c0add.mailgun.org',
  authentication: :plain,
  content_type:   'text/html'
}
ActionMailer::Base.delivery_method = :smtp

#Makes debigging *way* easier...
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail only emails you.
#http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to = 'ckib16@gmail.com'
    message.cc = nil
    message.bcc = nil
  end
end

#Locally, outgoing mail will be 'intercepted' by the above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end