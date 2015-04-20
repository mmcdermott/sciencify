if Rails.env != 'test'
  email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
  #email_settings[Rails.env][:password] = ENV['MAIL_PASSWORD']
  #email_settings[Rails.env][:user_name] = ENV['MAIL_USERNAME']
  email_settings[Rails.env][:user_name] = ENV['MAIL_USERNAME']
  email_settings[Rails.env][:password] = ENV['MAIL_PASSWORD']
  #email_settings[Rails.env][:authentication] = :plain
  ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings.nil?
end
