module InstanceCounter
    def self.included(base)
      base.extend ClassMethods
      base.include InstanceMethods
    end

    protected

    module ClassMethods

      def instances
        @instances || 0
      end

      def instance_increace
        @instances =  instances + 1
      end
    end

    module InstanceMethods

      def register_instance
        self.class.instance_increace
      end
    end
end
