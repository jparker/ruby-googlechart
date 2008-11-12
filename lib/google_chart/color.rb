module GoogleChart
  module Color
    def self.included(klass)
      klass.register!(:color)
    end
    
    def color=(color)
      @color = [color].flatten
    end
    
    def color
      "chco=#{@color.join(',')}" if @color
    end
  end
end
