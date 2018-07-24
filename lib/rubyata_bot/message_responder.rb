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
      begin
        api.delete_message(chat_id: chat_id, message_id: message.message_id) \
          if chinese_users.any?

        chinese_users.each do |member|
          api.kick_chat_member(chat_id: chat_id, user_id: member.id)
        end
      rescue Telegram::Bot::Exceptions::ResponseError
        false
      end
    end
  end
end
