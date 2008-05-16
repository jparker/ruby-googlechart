module GoogleChart
  class Line < Base
    @@chart_types = { :line => 'lc', :xy => 'lxy', :sparkline => 'ls' }
    
    include Axes
    include Colors
    include Data
    include GridLines
    include Legends
    include LineStyles
    include RangeMarkers
    include Sizes
    include Titles
    
    def chart_type
      @chart_type ||= @@chart_types[:line]
      'cht=' + @chart_type if @chart_type
    end
    
    def type=(chart_type)
      @chart_type = @@chart_types[chart_type]
    end
  end
end
