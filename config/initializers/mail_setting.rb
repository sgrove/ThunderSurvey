ActionMailer::Base.smtp_settings = {
  :address              => ENV['SMTP_SERVER'],
  :port                 => ENV['SMTP_PORT'],
  :domain               => ENV['SMTP_DOMAIN'],
  :user_name            => ENV['SMTP_USER'],
  :password             => ENV['SMTP_PASS'],
  :authentication       => ENV['SMTP_AUTHENTICATION'],
  :enable_starttls_auto => ENV['SMTP_TLS']
} 

ActionMailer::Base.default_url_options[:host] = (Rails.env == 'production' ? "www.thundersurvey.com" : "localhost")