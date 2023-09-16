# frozen_string_literal: true

class DryStructGenerator < Fabrication::Generator::Base
  def self.supports?(_klass)
    true
  end

  def build_instance
    self._instance = _klass.new(**_attributes)
  end
end

Fabrication.configure do |config|
  config.generators << DryStructGenerator
end
