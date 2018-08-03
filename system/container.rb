# frozen_string_literal: true

require 'dry/system/container'

# Container for app
class App < Dry::System::Container
  setting :token

  configure do |config|
    config.auto_register = %w[lib/rubyata_bot]
    config.token = ENV['BOT_TOKEN']
  end

  load_paths!('lib')
end
