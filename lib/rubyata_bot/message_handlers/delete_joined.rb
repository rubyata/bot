# frozen_string_literal: true

require 'import'
require 'rubyata_bot/message_handlers/base'

module RubyataBot
  module MessageHandlers
    # Handles messages
    class DeleteJoined < Base
      def perform
        return unless message.respond_to?(:new_chat_members)
        return if message.new_chat_members.empty?

        return unless message.respond_to?(:message_id)

        api_request do
          api.delete_message(chat_id: chat_id, message_id: message.message_id)
        end
      end
    end
  end
end
