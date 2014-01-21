source 'https://rubygems.org'
ruby "1.9.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development

# Use PostgreSQL as the production database
gem 'pg', group: :production

# Use LESS for stylesheets
gem 'less-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use devise for user authentication
gem 'devise'

# Add OmniAuth OAuth support
gem 'omniauth'

# Add Google OAuth2 login
gem 'omniauth-google-oauth2'

# Use Twitter Bootstrap
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git', :branch => 'bootstrap3'

# Bootstrap date picker
gem 'bootstrap-datepicker-rails'

# Bootstrap form helper
gem 'bootstrap_form'

# Use Font Awesome icons
gem 'font-awesome-rails'

# Nested form helper
gem 'nested_form'

# Add support for heroku
gem 'rails_12factor', group: :production
gem 'heroku-api'

# Add New Relic monitoring
gem 'newrelic_rpm'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'  # Chrome Rails console
  gem 'bullet'        # DB query lint
  gem 'rails_best_practices'
end

group :development, :test do
  gem 'dotenv-rails'    # Setup ENV for non-production
  gem 'guard-rails'
end

# Testing
group :test do
  gem 'simplecov', :require => false
  gem 'coveralls', :require => false
  gem 'minitest-spec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara_minitest_spec'
  gem 'turn'
end
