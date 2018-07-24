# frozen_string_literal: true

module RubyataBot
  # Just runner
  class Runner
    def run
      config = RubyataBot.config
      bot = Telegram::Bot::Client.new(config.token, logger: config.logger)
      bot.listen do |message|
        MessageResponder.new(api: bot.api, message: message).respond
      end
    end
  end
end
