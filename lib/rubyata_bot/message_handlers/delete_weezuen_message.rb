# frozen_string_literal: true

require 'import'
require 'rubyata_bot/message_handlers/base'
require 'unicode/emoji'

module RubyataBot
  module MessageHandlers
    # Handles messages
    class DeleteWeezuenMessage < Base
      def perform
        return unless message.respond_to?(:text)

        if message.text.include?('weezuen') || message.text.scan(Unicode::Emoji::REGEX).size >= 6
          api_request do
            api.delete_message(chat_id: chat_id, message_id: message.message_id)
          end
        end
      end
    end
  end
end
