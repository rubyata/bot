# frozen_string_literal: true

require 'dry/system'

# Container for app
class App < Dry::System::Container
  use :zeitwerk

  configure do |config|
    # config.auto_register = %w[lib/rubyata_bot]
    config.component_dirs.add 'lib'
  end

  add_to_load_path!('lib')
end
