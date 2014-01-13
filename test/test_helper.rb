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
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Warden::Test::Helpers
  include Capybara::DSL
  Warden.test_mode!
end
