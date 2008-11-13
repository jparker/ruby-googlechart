module GoogleChart
  class Bar < Base
    include Axis
    include BarStyle
    include Color
    include Data
    include GridLine
    include Legend
    include RangeMarker
    include Title
    
    @@orientations = {:horizontal => 'h', :vertical => 'v'}
    @@groupings    = {:grouped    => 'g', :stacked  => 's'}
    
    attr_writer :orientation, :grouping
    
    def horizontal=(arg)
      self.orientation = arg ? :horizontal : :vertical
    end
    
    def grouped=(arg)
      self.grouping = arg ? :grouped : :stacked
    end
    
    def chart_type
      @grouping    ||= :stacked
      @orientation ||= :vertical
      "cht=b#{@@orientations[@orientation]}#{@@groupings[@grouping]}"
    end
  end
end
