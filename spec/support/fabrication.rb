class DryStructGenerator < Fabrication::Generator::Base
  def self.supports?(klass)
    return true
  end

  def build_instance
    self._instance = _klass.new(**_attributes)
  end
end

Fabrication.configure do |config|
  config.generators << DryStructGenerator
end
