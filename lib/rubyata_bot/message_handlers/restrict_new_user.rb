# frozen_string_literal: true

require 'import'
require 'rubyata_bot/message_handlers/base'

module RubyataBot
  module MessageHandlers
    # Bans users to read only
    class RestrictNewUser < Base
      def perform
        return unless message.respond_to?(:new_chat_members)

        api_request do
          new_members = Array(message.new_chat_members)

          new_members.each do |member|
            api.restrict_chat_member(**restriction_options.merge(user_id: member.id))
          end
        end
      end

      private

      def restriction_options
        {
          chat_id: chat_id,
          until_date: (Time.now + 3600 * 24).to_i,
          can_send_messages: false,
          can_send_media_messages: false,
          can_send_other_messages: false,
          can_add_web_page_previews: false
        }
      end
    end
  end
end
