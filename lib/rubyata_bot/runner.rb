# frozen_string_literal: true

require 'import'

module RubyataBot
  # Just runner
  class Runner
    include Import['telegram.bot', 'rollbar']

    def run
      bot.listen do |message|
        MessageResponder.new(message: message).respond
      end
    rescue StandardError => error
      rollbar.error(error)
      raise error
    end
  end
end
