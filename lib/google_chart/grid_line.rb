module GoogleChart
  module GridLine
    def self.included(klass)
      klass.register!(:grid)
    end
    
    attr_writer :grid
    
    def grid
    end
  end
end
