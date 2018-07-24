# frozen_string_literal: true

Fabricator(:chat, class_name: 'Telegram::Bot::Types::Chat') do
  id { sequence }
end
