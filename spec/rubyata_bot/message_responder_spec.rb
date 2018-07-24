require 'spec_helper'

describe RubyataBot::MessageResponder do
  context "when chinese spammer enters" do
    let(:bot) { double(:bot, api: api) }
    let(:api) { double(:api) }
    let(:message) do
      double(:message, chat: double(:chat, id: 100),
             new_chat_members: [ double(:member, first_name: "A" * 100, last_name: "QQ", id: 200)]
            )
    end
    let(:responder) { described_class.new(bot: bot, message: message) }

    it "should ban it" do
      allow(api).to receive(:kick_chat_member)
      responder.respond
      expect(api).to have_received(:kick_chat_member).with(chat_id: 100, user_id: 200).once
    end
  end
end
