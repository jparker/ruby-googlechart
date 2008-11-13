# <URL:http://code.google.com/apis/chart/#bar_width>
module GoogleChart
  module BarStyle
    def self.included(klass)
      klass.register!(:style)
    end
    
    attr_writer :width
    
    # TODO: raise error if bar spacing > group spacing?
    def spacing=(spacing)
      @spacing = [spacing].flatten
    end
    
    def style
      "chbh=#{[@width, *@spacing].compact.join(',')}" if @width
    end
  end
end
