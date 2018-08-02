# frozen_string_literal: true

require 'spec_helper'

describe RubyataBot::MessageResponder do
  let(:api) { double(:api) }
  let(:message) { Fabricate(:spammer_joined_message) }
  let(:responder) { described_class.new(message: message) }

  before do
    App.stub('telegram.bot', double(:bot, api: api))
    allow(api).to receive(:delete_message) \
      .and_raise(MyTelegramResponseError)
    allow(api).to receive(:kick_chat_member)
    allow(responder).to receive(:handle_error)
  end

  it 'should ignore telegram response exception' do
    responder.respond
  end

  it 'should call handle_error' do
    responder.respond
    expect(responder).to have_received(:handle_error)
  end
end
