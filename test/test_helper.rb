ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  include Devise::TestHelpers
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:google_oauth2, {
    :info => {:name => "Joe Smith", :email => "joe@example.com"}, :uid => '12345'
  })
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Warden::Test::Helpers
  include Capybara::DSL
  Warden.test_mode!
end
