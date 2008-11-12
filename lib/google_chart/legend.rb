module GoogleChart
  module Legend
    def self.included(klass)
      klass.register!(:legend)
    end
    
    attr_writer :legend
    
    def legend
    end
  end
end
