# frozen_string_literal: true
require 'dry-configurable'

# RubyataBot is used by telegram.me/rubyata chat for administrative tasks
module RubyataBot
  extend Dry::Configurable

  ROOT        = Pathname.new(::File.expand_path('../../', __FILE__)).freeze
  ENVIRONMENT = ENV.fetch('BOT_ENV', 'development').freeze

  setting :token, ENV['BOT_TOKEN']
  setting :logger, Logger.new(ENV.fetch('BOT_LOGFILE') { STDOUT })

  def self.run
    Runner.new.run
  end
end
