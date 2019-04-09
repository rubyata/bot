# frozen_string_literal: true

require 'spec_helper'

describe RubyataBot::MessageHandlers::KickSpammer do
  let(:api) { double(:api) }
  let(:message) { Fabricate(:spammer_joined_message) }
  let(:message_handler) { described_class.new(message: message) }

  before do
    App.stub('telegram.bot', double(:bot, api: api))
    allow(api).to receive(:delete_message) \
      .and_raise(MyTelegramResponseError)
    allow(api).to receive(:kick_chat_member)
    allow(message_handler).to receive(:handle_error)
  end

  it 'should ignore telegram response exception' do
    message_handler.perform
  end

  it 'should call handle_error' do
    message_handler.perform
    expect(message_handler).to have_received(:handle_error)
  end
end
