# frozen_string_literal: true

# doc: false
class MyTelegramResponseError < Telegram::Bot::Exceptions::ResponseError
  FakeResponse = Struct.new(:body, :status) do
    def env
      OpenStruct.new(url: URI.parse('https://api.telegram.org'))
    end
  end

  def initialize
    super(response: FakeResponse.new('{"error_code":400,"description":"error"}', 400))
  end

  def to_s
    'error'
  end
end
