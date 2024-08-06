# frozen_string_literal: true

ENV['BOT_ENV'] ||= 'test'
ENV['BOT_LOGFILE'] ||= '/dev/null'

require 'rubygems'
require 'bundler/setup'
require 'fabrication'

$LOAD_PATH.unshift 'system'
$LOAD_PATH.unshift 'lib'

require 'container'

require 'dry/system/stubs'
App.enable_stubs!

App.finalize!
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
