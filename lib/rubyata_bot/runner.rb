# frozen_string_literal: true

require 'import'

module RubyataBot
  # Just runner
  class Runner
    include Import['telegram.bot', 'rollbar']

    def run
      bot.listen do |message|
        MessageHandlers.perform(message)
      end
    rescue StandardError => e
      rollbar.error(e)
      raise e
    end
  end
end
