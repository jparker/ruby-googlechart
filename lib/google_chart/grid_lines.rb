module GoogleChart
  module GridLines
    def self.included(klass)
      klass.register! :grids => 'chg' unless klass == GoogleChart::Base
    end
    
    @@default_grid_step = 0
    @@grid_line_styles = { :solid => [1,0], :dash => [3,2], :dot => [1,2] }
    
    protected
    # Returns the grid style parameter, if present.
    def grids
      @grids.join(',') unless @grids.nil?
    end
    
    # Sets the grid style parameter. +grids+ should be a Hash. The :x and :y
    # keys should point to the step size for the respective grid lines. The
    # :style key should point to a named style defined in @@grid_line_styles.
    # The default grid step size is 0 (no grid displayed).
    def grids=(grids)
      @grids = grids.values_at(:x, :y).collect {|w| w || @@default_grid_step }
      @grids.push(*@@grid_line_styles[grids[:style]]) if grids[:style]
    end
  end
end
