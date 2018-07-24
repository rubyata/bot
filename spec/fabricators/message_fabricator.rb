# frozen_string_literal: true

Fabricator(:message, class_name: 'Telegram::Bot::Types::Message') do
  message_id { sequence }
end

Fabricator(:spammer_joined_message, from: :message) do
  new_chat_members do
    [Fabricate(:user, first_name: 'a' * 100, last_name: 'QQ')]
  end
  chat { Fabricate(:chat, id: 100) }
end
