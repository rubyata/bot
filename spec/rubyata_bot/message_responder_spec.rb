# frozen_string_literal: true

require 'spec_helper'

describe RubyataBot::MessageResponder do
  context 'when chinese spammer enters' do
    let(:api) { double(:api) }
    let(:message) do
      chinese_members = [
        double(:user, first_name: 'A' * 100, last_name: 'QQ', id: 200)
      ]
      chat = double(:chat, id: 100)
      double(:message, id: 300, chat: chat, chinese_members: chinese_members)
    end
    let(:responder) { described_class.new(api: api, message: message) }

    before do
      allow(api).to receive(:kick_chat_member)
      allow(api).to receive(:delete_message)
      responder.respond
    end

    it 'should ban it' do
      expect(api).to have_received(:kick_chat_member) \
        .with(chat_id: 100, user_id: 200).once
    end

    it 'should delete join message' do
      expect(api).to have_received(:delete_message) \
        .with(chat_id: 100, message_id: 300).once
    end
  end
end
