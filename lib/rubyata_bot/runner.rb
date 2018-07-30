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
        if message.text == '/ping'
          api.send_message(chat_id: message.chat.id, text: 'pong')
        end
        MessageResponder.new(api: api, message: message).respond
      end
    end

    def api
      @bot.api
    end
  end
end
