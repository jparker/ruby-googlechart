module GoogleChart
  class Line < Base
    @@chart_types = { :line => 'lc', :xy => 'lxy', :sparkline => 'ls' }
    
    include Axis
    include Color
    include Data
    include GridLine
    include Legend
    include LineStyle
    include RangeMarker
    include Title
    
    def chart_type
      @chart_type ||= @@chart_types[:line]
      'cht=' + @chart_type if @chart_type
    end
    
    def chart_type=(chart_type)
      @chart_type = @@chart_types[chart_type]
    end
    alias_method :type=, :chart_type=
  end
end
