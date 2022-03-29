# frozen_string_literal: true

require 'import'

module RubyataBot
  module MessageHandlers
    # Base class
    class Base
      include Import['logger', 'telegram.bot', 'rollbar']
      attr_reader :message, :chat_id

      def initialize(args)
        @message = args.delete(:message)
        @chat_id = @message.chat.id
        super(args)
      end

      private

      def api
        bot.api
      end

      def api_request
        yield
      rescue Telegram::Bot::Exceptions::ResponseError => e
        handle_error(e)
      end

      def handle_error(error)
        logger.warn(error)
        rollbar.warning(error, message: message.to_compact_hash)
      end
    end
  end
end
