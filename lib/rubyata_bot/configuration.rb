# frozen_string_literal: true

module RubyataBot
  # Configuration module
  class Configuration
    attr_reader :token, :logger

    def initialize
      @token  = ENV['BOT_TOKEN']
      @logger = Logger.new(ENV.fetch('BOT_LOGFILE') { STDOUT })

      logger.level = ENV.fetch('BOT_LOGLEVEL') { Logger::DEBUG }.to_i
    end
  end
end
