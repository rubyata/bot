# frozen_string_literal: true

$LOAD_PATH << ::File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'logger'
require 'rubyata_bot'

Bundler.require :default, RubyataBot::ENVIRONMENT
Dotenv.load RubyataBot::ROOT.join('.env'), RubyataBot::ROOT.join(".env.#{RubyataBot::ENVIRONMENT}") if defined? Dotenv

%w[lib].each do |dir|
  Dir[RubyataBot::ROOT.join(dir, '**/*.rb')].each { |file| require file }
end
