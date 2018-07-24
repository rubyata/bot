# frozen_string_literal: true

module RubyataBot
  # Refinements of telegram entity classes
  module TelegramEntityExtensions
    refine Telegram::Bot::Types::Message do
      def chinese_members
        new_chat_members.select(&:chinese?)
      end
    end
  end
end
