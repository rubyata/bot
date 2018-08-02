# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

gem 'dry-system'
gem 'rollbar'
gem 'telegram-bot-ruby', '~> 0.8.6'

group :development, :test do
  gem 'dotenv'
  gem 'pry-byebug'
end

group :development do
  gem 'rubocop'
  gem 'rubycritic'
end

group :test do
  gem 'fabrication'
  gem 'rspec', '~> 3.7.0'
  gem 'rspec_junit_formatter'
end
