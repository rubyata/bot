# frozen_string_literal: true

require 'spec_helper'

describe RubyataBot::MessageResponder do
  context 'when chinese spammer enters' do
    let(:api) { double(:api) }
    let(:message) { Fabricate(:spammer_joined_message) }
    let(:responder) { described_class.new(api: api, message: message) }

    context 'when there is no telegram exceptions' do
      before do
        allow(api).to receive(:kick_chat_member)
        allow(api).to receive(:delete_message)
        responder.respond
      end

      it 'should ban it' do
        expect(api).to have_received(:kick_chat_member).once
      end

      it 'should delete join message' do
        expect(api).to have_received(:delete_message).once
      end
    end

    context 'when telegram returns exception' do
      before do
        response = OpenStruct.new(body: 'ololo', status: 200,
                                  env: OpenStruct.new(url: 'ololo'))
        allow(api).to receive(:delete_message) \
          .and_raise(Telegram::Bot::Exceptions::ResponseError, response)
        allow(api).to receive(:kick_chat_member)
      end

      it 'should ignore telegram response exception' do
        responder.respond
      end
    end
  end
end
