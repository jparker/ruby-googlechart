module GoogleChart
  module Axis
    def self.included(klass)
      klass.register!(:axis)
    end
    
    attr_writer :axis
    
    def axis
    end
  end
end
