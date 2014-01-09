namespace :test do
  task :coverage do
    require 'simplecov'
    SimpleCov.start 'rails'
    Rake::Task["test"].execute
  end
end
