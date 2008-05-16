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
    
    attr_writer :horizontal, :grouped
    
    def chart_type
      'cht=b' + (horizontal? ? 'h' : 'v') + (grouped? ? 'g' : 's')
    end
    
    def horizontal?
      @horizontal
    end
    
    def grouped?
      @grouped
    end
  end
end
