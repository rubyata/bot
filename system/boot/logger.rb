# frozen_string_literal: true

App.boot(:logger) do
  init do
    require 'logger'
    register(:logger, Logger.new(ENV.fetch('BOT_LOGFILE') { $stdout }))
  end
end
