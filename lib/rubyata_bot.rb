# frozen_string_literal: true


# RubyataBot is used by telegram.me/rubyata chat for administrative tasks
module RubyataBot
  ROOT        = Pathname.new(::File.expand_path('../../', __FILE__)).freeze
  ENVIRONMENT = ENV.fetch('BOT_ENV', 'development').freeze

  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end

    def run
      Runner.new.run
    end
  end
end
