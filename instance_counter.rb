module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_reader :instances
    @@instances = 0

    def self.instances
      @@instances
    end
  end

  module InstanceMethods
    def register_instance
      @@instances += 1
    end

    protected

    def initialize
      register_instance
      super
    end
  end
end
