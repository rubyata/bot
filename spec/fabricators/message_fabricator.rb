# frozen_string_literal: true

Fabricator(:message, class_name: 'Telegram::Bot::Types::Message') do
  message_id { sequence }
  date { Date.new(2009, 11, 26).to_time.to_i }
end

Fabricator(:spammer_joined_message, from: :message) do
  new_chat_members do
    [Fabricate.build(:user, first_name: 'a' * 100, last_name: 'QQ')]
  end
  chat { Fabricate.build(:chat, id: 100) }
end
