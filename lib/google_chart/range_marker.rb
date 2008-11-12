module GoogleChart
  module RangeMarker
    def self.included(klass)
      klass.register!(:ranges)
    end
    
    attr_writer :ranges
    
    def ranges
    end
  end
end
