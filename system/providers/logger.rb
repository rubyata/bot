# frozen_string_literal: true

App.register_provider(:logger) do
  prepare do
    require 'logger'

    register(:logger, Logger.new(ENV.fetch('BOT_LOGFILE') { $stdout }))
  end
end
