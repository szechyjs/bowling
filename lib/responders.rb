require 'action_controller'
require 'responders/flash'

module Responders
  class BowlingResponder < ActionController::Responder
    include Flash
  end
end

ActionController::Base.responder = Responders::BowlingResponder

require 'active_support/i18n'
I18n.load_path << File.expand_path('../responders/locales/en.yml', __FILE__)
