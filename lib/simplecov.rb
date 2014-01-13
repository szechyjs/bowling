if Rails.env == "test"
  require 'simplecov'
  require 'coveralls'
end

module Bowling
  module Railties
    class SimpleCov < Rails::Railtie
      config.before_initialize do
        if Rails.env == "test"
          ::SimpleCov.formatter = ::SimpleCov::Formatter::MultiFormatter[
            ::SimpleCov::Formatter::HTMLFormatter,
            ::Coveralls::SimpleCov::Formatter
          ]
          ::SimpleCov.start 'rails' do
            add_filter "/test"
          end
        end
      end
    end
  end
end
