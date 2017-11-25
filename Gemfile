# A sample Gemfile
source "https://rubygems.org"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use postgreSQL as the database for Active Record
gem 'pg'
# Use Unicorn as the app server
gem 'unicorn'
# Use SCSS for stylesheets
gem 'sass-rails'
gem 'less-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use nokogiri for the Scraping articles
gem 'nokogiri'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use ActiveModel has_secure_password
gem 'bcrypt'
# Use SlackAPI as the mailing method
gem 'slack-api'
# ansynclogical task exec
gem 'delayed_job_active_record'
gem 'daemons' #これも入れないとbackground実行できない
# Use Scraper
gem "mechanize"
gem "pry"
gem "selenium-webdriver"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rb-readline'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13.0'
  # Test
  gem 'rspec-rails'
  gem "factory_girl_rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
