# <URL:http://code.google.com/apis/chart/#line_bar_pie_colors>
module GoogleChart
  module Colors
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
