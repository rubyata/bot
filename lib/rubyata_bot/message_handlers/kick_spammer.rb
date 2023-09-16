# frozen_string_literal: true

require 'import'
require 'rubyata_bot/message_handlers/base'

module RubyataBot
  module MessageHandlers
    # Handles messages
    class KickSpammer < Base
      def perform
        return unless message.respond_to?(:new_chat_members)

        spammers = qq_users(message)
        delete_spam_message if spammers.any?
        kick_users(spammers)
      end

      private

      def qq_users(message)
        users = Array(message.new_chat_members)

        users.select do |user|
          full_name = [user.first_name, user.last_name].join(' ')
          full_name.size > 100 && full_name.include?('QQ')
        end
      end

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
