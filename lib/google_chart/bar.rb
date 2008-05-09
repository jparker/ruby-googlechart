module GoogleChart
  class Bar < GoogleChart::Base
    include GoogleChart::Axes
    include GoogleChart::GridLines
    
    @@groupings = { :grouped => 'g', :stacked => 's' }
    @@orientations = { :horizontal => 'h', :vertical => 'v' }
    
    protected
    def type
      "b#{orientation}#{grouping}"
    end
    
    def orientation
      @orientation ||= @@orientations[:vertical]
    end
    
    def grouping
      @grouping ||= @@groupings[:stacked]
    end
    
    def horizontal=(true_false)
      @orientation = true_false ? @@orientations[:horizontal] : @@orientations[:vertical]
    end
    
    def grouped=(true_false)
      @grouping = true_false ? @@groupings[:grouped] : @@groupings[:stacked]
    end
  end
end
