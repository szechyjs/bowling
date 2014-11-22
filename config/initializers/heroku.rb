unless ENV['HEROKU_API_KEY'].nil?
  require 'heroku-api'

  APP = ENV['HEROKU_APP_NAME']

  heroku = Heroku::API.new
  release = heroku.get_releases(APP).body.last

  ENV['HEROKU_RELEASE_NAME'] = release['name']
  ENV['HEROKU_RELEASE_COMMIT'] = release['commit']
end
