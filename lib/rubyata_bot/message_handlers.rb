# frozen_string_literal: true

module RubyataBot
  # Runs each message handler
  module MessageHandlers
    def self.perform(message)
      KickSpammer.new(message: message).perform
      RestrictNewUser.new(message: message).perform
    end
  end
end
