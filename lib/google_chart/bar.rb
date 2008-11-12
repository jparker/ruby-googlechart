module GoogleChart
  class Bar < Base
    include Axes
    include BarStyles
    include Colors
    include Data
    include GridLines
    include Legends
    include RangeMarkers
    include Sizes
    include Titles
    
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
