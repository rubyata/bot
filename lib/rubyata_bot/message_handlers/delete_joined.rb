# frozen_string_literal: true

require 'import'
require 'rubyata_bot/telegram_entity_extensions/message'
require 'rubyata_bot/telegram_entity_extensions/user'
require 'rubyata_bot/message_handlers/base'

module RubyataBot
  module MessageHandlers
    # Handles messages
    class DeleteJoined < Base
      using TelegramEntityExtensions

      def perform
        if message.new_chat_members.any?
          api_request do
            api.delete_message(chat_id: chat_id, message_id: message.message_id)
          end
        end
      end
    end
  end
end
