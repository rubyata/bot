# frozen_string_literal: true

require 'import'
require 'rubyata_bot/telegram_entity_extensions/message'
require 'rubyata_bot/telegram_entity_extensions/user'
require 'rubyata_bot/message_handlers/base'

module RubyataBot
  module MessageHandlers
    # Handles messages
    class KickSpammer < Base
      using TelegramEntityExtensions

      def perform
        chinese_users = message.chinese_members

        delete_spam_message if chinese_users.any?
        kick_users(chinese_users)
      end

      private

      def delete_spam_message
        api_request do
          api.delete_message(chat_id: chat_id, message_id: message.message_id)
        end
      end

      def kick_users(users)
        users.each do |member|
          api_request do
            api.kick_chat_member(chat_id: chat_id, user_id: member.id)
          end
        end
      end
    end
  end
end
