# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  #   domain: 'gmail.com',
  user_name: 'labsdb',
  password: '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',
  authentication: :plain,
  enable_starttls_auto: true
}
