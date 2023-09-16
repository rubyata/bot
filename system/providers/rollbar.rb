# frozen_string_literal: true

App.register_provider(:rollbar) do
  prepare do
    require 'rollbar'

    Rollbar.configure do |config|
      config.access_token = ENV['ROLLBAR_TOKEN']
      config.enabled = ENV['BOT_ENV'] == 'production'
    end
    register(:rollbar, Rollbar.notifier)
  end
end
