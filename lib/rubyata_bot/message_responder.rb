# frozen_string_literal: true

module RubyataBot
  # Handles messages
  class MessageResponder
    using RubyataBot::TelegramEntityExtensions
    attr_reader :api, :message, :chat_id

    def initialize(api:, message:)
      @api      = api
      @message  = message
      @chat_id = @message.chat.id
    end

    def respond
      chinese_users = message.chinese_members
      api.delete_message(chat_id: chat_id, message_id: message.id) \
        if chinese_users.any?

      chinese_users.each do |member|
        api.kick_chat_member(chat_id: chat_id, user_id: member.id)
      end
    end
  end
end
