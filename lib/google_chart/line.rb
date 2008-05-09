module GoogleChart
  class Line < GoogleChart::Base
    include GoogleChart::Axes
    
    @@types = { :line => 'lc', :xy => 'lxy', :sparkline => 'ls' }
    
    protected
    # Returns the chart type. Default chart type is a basic line chart.
    def type
      @type ||= @@types[:line]
    end
    
    # Sets the chart type.
    def type=(t)
      @type = @@types[t]
    end
  end
end
