# frozen_string_literal: true

module RubyataBot
  # Refinements of telegram entity classes
  module TelegramEntityExtensions
    refine Telegram::Bot::Types::User do
      def chinese?
        full_name = [first_name, last_name].join(' ')
        full_name.size > 100 && full_name.include?('QQ')
      end
    end
  end
end
