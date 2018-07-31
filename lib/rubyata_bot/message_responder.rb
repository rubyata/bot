# frozen_string_literal: true

module RubyataBot
  # Handles messages
  class MessageResponder
    using RubyataBot::TelegramEntityExtensions
    attr_reader :api, :message, :chat_id, :logger

    def initialize(api:, message:, logger: RubyataBot.config.logger)
      @api      = api
      @message  = message
      @chat_id = @message.chat.id
      @logger = logger
    end

    def respond
      chinese_users = message.chinese_members
      delete_spam_message if chinese_users.any?

      kick_users(chinese_users)
    rescue Telegram::Bot::Exceptions::ResponseError => error
      logger.error(error)
    end

    private

    def delete_spam_message
      api_request do
        api.delete_message(chat_id: chat_id, message_id: message.message_id)
      end
    end

    def api_request
      yield
    rescue Telegram::Bot::Exceptions::ResponseError => error
      logger.error(error)
      Rollbar.warning(error, message: message.to_compact_hash)
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
