source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Bootstrap SCSS
gem 'bootstrap-sass', '~> 3.0.2'

# HTTP Requests
gem 'faraday', '~> 0.8.8'

# Caching images
gem 'rack-cache', '~> 1.2'
gem 'dalli', '~> 2.6.4'
gem 'kgio', '~> 2.8.1'
gem 'memcachier', '~> 0.0.2'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Live reload page
  gem 'guard-livereload', '~> 2.1.0'

  # Error REPL
  gem 'better_errors', '~> 1.0.1'
end

group :production do
  gem 'unicorn', '~> 4.7.0'

  # Use Postgresql as the database for Active Record
  gem 'pg', '~> 0.17.0'

  # Heroku
  gem 'rails_12factor', '~> 0.0.2'
end
