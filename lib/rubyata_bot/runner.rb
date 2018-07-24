# frozen_string_literal: true

module RubyataBot
  class Runner
    extend Forwardable

    def_delegators :'RubyataBot.config', :token, :logger

    def run!
      Telegram::Bot::Client.run(token, logger: logger) do |bot|
        bot.listen do |message|
          MessageResponder.new(bot: bot, message: message).respond
        end
      end
    end
  end
end
