# frozen_string_literal: true

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
  end
end
