# frozen_string_literal: true

module RubyataBot
  # Just runner
  class Runner
    attr_reader :bot, :config

    def initialize
      @config = RubyataBot.config
      token = config.token
      logger = config.logger
      @bot = Telegram::Bot::Client.new(token, logger: logger)
    end

    def run
      bot.listen do |message|
        MessageResponder.new(api: api, message: message).respond
      end
    rescue StandardError => error
      Rollbar.error(error)
      raise error
    end

    def api
      @bot.api
    end
  end
end
