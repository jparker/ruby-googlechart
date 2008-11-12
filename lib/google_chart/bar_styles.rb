# <URL:http://code.google.com/apis/chart/#bar_width>
module GoogleChart
  module BarStyles
    def self.included(klass)
      klass.register!(:style)
    end
    
    attr_writer :width
    
    def style
      "chbh=#{[@width, *@spacing].compact.join(',')}" if @width
    end
    
    # Spacing can be given as a single number for space between bars within a
    # group or as an array of numbers with the first element as the space
    # between bars within a group and the second element as the space between
    # groups. If not provided, the default spacing between groups is 8 pixels.
    # 
    # TODO: Should we raise an error if bar spacing is greater than group
    # spacing? This would visually group bars from different groups.
    def spacing=(spacing)
      @spacing = [spacing].flatten
    end
  end
end
