module GoogleChart
  module BarStyles
    attr_writer :width
    
    def style
      if @width
        "chbh=#{@width}" + (@spacing ? ",#{@spacing.join(',')}" : '')
      elsif @spacing
        raise 'spacing requires width option'
      end
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