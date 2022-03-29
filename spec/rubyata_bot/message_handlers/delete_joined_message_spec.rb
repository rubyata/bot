# frozen_string_literal: true

require 'spec_helper'

describe RubyataBot::MessageHandlers::DeleteJoined do
  let(:api) { double(:api) }
  let(:message) { Fabricate(:spammer_joined_message) }
  let(:message_handler) { described_class.new(message: message) }

  before do
    App.stub('telegram.bot', double(:bot, api: api))
    allow(api).to receive(:delete_message)
    message_handler.perform
  end

  it 'should delete join message' do
    expect(api).to have_received(:delete_message).once
  end
end
