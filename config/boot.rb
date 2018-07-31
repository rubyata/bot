# frozen_string_literal: true

$LOAD_PATH << ::File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'logger'
require 'telegram/bot'
require 'rubyata_bot'

Bundler.require :default, RubyataBot::ENVIRONMENT
common_env_file = RubyataBot::ROOT.join('.env')
env_file = RubyataBot::ROOT.join(".env.#{RubyataBot::ENVIRONMENT}")
Dotenv.load(common_env_file, env_file) if defined? Dotenv

Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_TOKEN']
  config.enabled = RubyataBot::ENVIRONMENT == 'production'
end

require 'rubyata_bot/telegram_entity_extensions/message'
require 'rubyata_bot/telegram_entity_extensions/user'

%w[lib].each do |dir|
  Dir[RubyataBot::ROOT.join(dir, '**/*.rb')].each { |file| require file }
end
