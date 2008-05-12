module GoogleChart
  module GridLines
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
