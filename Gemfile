# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cancancan'
gem 'carrierwave'
gem 'devise'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'haml-rails', '~> 2.0'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'mini_magick'
gem 'puma', '~> 4.1'
gem 'rails', '6.0.3.1'
gem 'rails_admin'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'capybara-email'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'fog'
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
