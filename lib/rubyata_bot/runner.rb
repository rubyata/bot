# frozen_string_literal: true

module RubyataBot
  # Just runner
  class Runner
    extend Forwardable

    def run
      bot = Telegram::Bot::Client.new(RubyataBot.config.token, logger: RubyataBot.config.logger)
      bot.listen do |message|
        MessageResponder.new(api: bot.api, message: message).respond
      end
    end
  end
end
