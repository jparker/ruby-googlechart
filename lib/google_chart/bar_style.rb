module GoogleChart
  module BarStyle
    def self.included(klass)
      klass.register!(:style)
    end
    
    attr_writer :width
    
    def spacing=(spacing)
      @spacing = [spacing].flatten
    end
    
    def style
      "chbh=#{[@width, *@spacing].compact.join(',')}" if @width
    end
  end
end
