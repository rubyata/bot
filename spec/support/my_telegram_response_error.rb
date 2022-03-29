# frozen_string_literal: true

# doc: false
class MyTelegramResponseError < Telegram::Bot::Exceptions::ResponseError
  def initialize
    super('error')
  end

  def to_s
    'error'
  end
end
