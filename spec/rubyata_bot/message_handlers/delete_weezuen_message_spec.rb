# frozen_string_literal: true

require 'spec_helper'

describe RubyataBot::MessageHandlers::DeleteWeezuenMessage do
  let(:api) { double(:api) }

  subject { described_class.new(message: message).perform }

  before do
    App.stub('telegram.bot', double(:bot, api: api))
    allow(api).to receive(:delete_message)
  end

  context 'when message contains "weezuen" string' do
    let(:message) do
      Fabricate.build :message,
        text: 'bla bla weezuen bla bla'
    end

    specify do
      subject
      expect(api).to have_received(:delete_message).once
    end
  end

  context 'when message contains at least 6 emojis (becase no sane person will send so many emojis)' do
    let(:message) do
      Fabricate.build :message,
        text: %Q(😋😉😌😚😛😄😉)
    end

    specify do
      subject
      expect(api).to have_received(:delete_message).once
    end
  end

  context 'when message contains less than 6 emojis ' do
    let(:message) do
      Fabricate.build :message,
        text: %Q(😋😉😌😚)
    end

    specify do
      subject
      expect(api).not_to have_received(:delete_message)
    end
  end
end
