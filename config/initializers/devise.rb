
Devise.setup do |config|
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.authentication_keys = [ :login, :email ]

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.timeout_in = 5.minutes
  config.sign_out_via = :delete
end
