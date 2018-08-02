# frozen_string_literal: true

require 'import'
require 'rubyata_bot/telegram_entity_extensions/message'
require 'rubyata_bot/telegram_entity_extensions/user'

module RubyataBot
  # Handles messages
  class MessageResponder
    include Import['logger', 'telegram.bot', 'rollbar']
    using TelegramEntityExtensions
    attr_reader :message, :chat_id

    def initialize(args)
      @message = args.delete(:message)
      @chat_id = @message.chat.id
      super(args)
    end

    def respond
      chinese_users = message.chinese_members

      delete_spam_message if chinese_users.any?
      kick_users(chinese_users)
    end

    private

    def api
      bot.api
    end

    def delete_spam_message
      api_request do
        api.delete_message(chat_id: chat_id, message_id: message.message_id)
      end
    end

    def api_request
      yield
    rescue Telegram::Bot::Exceptions::ResponseError => error
      handle_error(error)
    end

    def handle_error(error)
      logger.warning(error)
      rollbar.warning(error, message: message.to_compact_hash)
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
