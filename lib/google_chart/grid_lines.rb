# <URL:http://code.google.com/apis/chart/#grid>
module GoogleChart
  module GridLines
    def self.included(klass)
      klass.register!(:grid)
    end
    
    @@grid_line_styles  = { :solid => [1,0], :dash => [3,2], :dot => [1,2] }
    @@default_grid_step = 0
    
    def grid
      'chg=' + @grid if @grid
    end
    
    def grid=(grid)
      grid[:x] ||= @@default_grid_step
      grid[:y] ||= @@default_grid_step
      @grid = [grid[:x], grid[:y], *@@grid_line_styles[grid[:style]]].compact.join(',')
    end
  end
end
