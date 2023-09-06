# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 5.0.6"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# Admin CRUD engine for administration backend
gem "activeadmin", "~> 2.13.1"
gem "activeadmin_addons", "~> 1.10.0"

# Object-based searching
gem "ransack", "~> 3.2.1"

gem "sidekiq"
gem "sidekiq-scheduler"

gem "searchkick", "~> 5.2.4"
gem "elasticsearch", "~> 8.9.0"
gem "httparty", "~> 0.21.0"
gem "pagy", "~> 6.0.4"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]

  gem "awesome_print", "~> 1.9.2"
  gem "database_cleaner", "2.0.2"
  gem "ffaker", "~> 2.21.0"
  gem "shoulda", "~> 4.0.0"
  gem "shoulda-context", "~> 2.0.0"
  gem "shoulda-matchers", "~> 4.5.1"
  gem "simplecov", "~> 0.22.0"
  gem "test-unit", "~> 3.5.7"
  gem "webmock", "3.17.0"

  # Rspec
  gem "factory_bot_rails", "~> 6.2.0"
  gem "rails-controller-testing"
  gem "rspec_junit_formatter", "~> 0.6.0"
  gem "rspec-rails", "~> 6.0.1"

  # Linters
  gem "rubocop", "1.48.1", require: false
  gem "rubocop-minitest", "0.29.0", require: false
  gem "rubocop-performance", "1.16.0", require: false
  gem "rubocop-rails", "2.18.0", require: false
  gem "rubocop-rspec", "2.19.0", require: false

  gem "lefthook", "~> 1.3.10"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "better_errors" # , "~> 2.9.1"
  gem "binding_of_caller" # , "~> 1.0.0"
  gem "spring" # , "~> 4.1.1"
end
