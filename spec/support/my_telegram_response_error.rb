# frozen_string_literal: true

# doc: false
class MyTelegramResponseError < Telegram::Bot::Exceptions::ResponseError
  def initialize; end

  def to_s
    'error'
  end
end
