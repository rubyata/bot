# frozen_string_literal: true

require 'spec_helper'

describe RubyataBot::MessageHandlers::RestrictNewUser do
  let(:api) { double(:api) }
  let(:message) { Fabricate(:spammer_joined_message) }
  let(:message_handler) { described_class.new(message: message) }

  before do
    App.stub('telegram.bot', double(:bot, api: api))
    allow(api).to receive(:restrict_chat_member)
  end

  it 'should restrict it' do
    message_handler.perform
    expect(api).to have_received(:restrict_chat_member).once
  end
end
