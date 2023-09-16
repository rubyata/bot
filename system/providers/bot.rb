# frozen_string_literal: true

App.register_provider(:telegram) do
  prepare do
    require 'telegram/bot'
  end

  start do
    target.start :logger

    bot = Telegram::Bot::Client.new(ENV['BOT_TOKEN'], logger: target[:logger])
    register('telegram.bot', bot)
  end
end
