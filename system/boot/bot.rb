# frozen_string_literal: true

App.boot(:telegram) do |container|
  use :logger

  init do
    require 'telegram/bot'
  end

  start do
    bot = Telegram::Bot::Client.new(container.config.token, logger: logger)
    container.register('telegram.bot', bot)
  end
end
