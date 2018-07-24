# frozen_string_literal: true

Fabricator(:user, class_name: 'Telegram::Bot::Types::User') do
  id { sequence }
  first_name { 'John' }
  last_name { 'Doe' }
end
