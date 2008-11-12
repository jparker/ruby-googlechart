module GoogleChart
  class Bar < AbstractChart
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
    
    attr_writer :grouping, :orientation
    
    def horizontal=(arg)
      self.orientation = arg ? :horizontal : :vertical
    end
    
    def stacked=(arg)
      self.grouping = arg ? :stacked : :grouped
    end
    
    def type
      @grouping    ||= :grouped
      @orientation ||= :vertical
      "cht=b#{@@orientations[@orientation]}#{@@groupings[@grouping]}"
    end
  end
end
