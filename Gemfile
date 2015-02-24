source 'https://rubygems.org'
ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1'
gem 'quiet_assets'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Bootstrap SCSS
gem 'bootstrap-sass', '~> 3.3.0'

# HTTP Requests
gem 'faraday', '~> 0.9.0'

# Caching images
gem 'rack-cache', '~> 1.2'
gem 'dalli', '~> 2.7.0'
gem 'kgio', '~> 2.9.1'
gem 'memcachier', '~> 0.0.2'

# Server monitoring
gem 'newrelic_rpm', '~> 3.8.0'

# Admin Interface
gem 'rails_admin', '=0.6.3'

# User authentication
gem 'devise', '~> 3.2.2'

# Accept Payments
gem 'stripe', '~> 1.13.0'

# Markdown parsing
gem 'redcarpet', '~> 3.1.1'

# Image uploading
gem 'paperclip', '~> 4.1.0'

# Form Builder
gem 'simple_form', '~> 3.0.1'

# Image storage
gem 'aws-sdk', '~> 1.42.0'

# Remote Form Support
gem 'jquery-rails', '~> 3'

# Mailing Lists
gem 'gibbon', '~> 1.1.2'

group :test do
  # Testing framework
  gem 'rspec-rails', '~> 2.14.0'

  # Test fixtures
  gem 'factory_girl_rails', '~> 4.4.1'

  # Request spec DSL
  gem 'capybara', '~> 2.3.0'

  # Disallow external requests in test env
  gem 'webmock', '~> 1.18.0'

  # Coverage stats
  gem 'simplecov', '~> 0.8.2', require: false
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Live reload page
  gem 'guard-livereload', '~> 2.2.0'

  # Error REPL
  gem 'better_errors', '~> 1.1.0'
  gem 'binding_of_caller', '~> 0.7.2'

  # Environment variables for dev and test
  gem 'dotenv-rails', '~> 0.11.0'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
end

group :production do
  gem 'unicorn', '~> 4.8.1'

  # Use Postgresql as the database for Active Record
  gem 'pg', '~> 0.17.0'

  # Heroku
  gem 'rails_12factor', '~> 0.0.2'
end
