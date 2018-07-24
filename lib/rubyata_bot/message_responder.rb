# frozen_string_literal: true

module RubyataBot
  class MessageResponder
    attr_reader :bot, :message

    def initialize(bot:, message:)
      @bot      = bot
      @message  = message
    end

    def respond
      message.new_chat_members.each do |member|
        ban(member, message: message) if chinese?(member)
      end
    end

    private
    def chinese?(member)
      full_name = [member.first_name, member.last_name].join(" ")
      full_name.size > 100 and full_name.include?("QQ")
    end

    def ban(member, message:)
      bot.api.kick_chat_member chat_id: message.chat.id, user_id: member.id
      bot.api.delete_message chat_id: message.chat.id, message_id: message.id
    end
  end
end
