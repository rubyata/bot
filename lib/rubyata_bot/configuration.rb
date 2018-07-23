# frozen_string_literal: true

module RubyataBot
  class Configuration
    attr_accessor :token,
                  :logger

    def initialize
      self.token  = ENV['BOT_TOKEN']
      self.logger = Logger.new(ENV.fetch('BOT_LOGFILE') { STDOUT })

      logger.level = ENV.fetch('BOT_LOGLEVEL') { Logger::DEBUG }.to_i
    end
  end
end
