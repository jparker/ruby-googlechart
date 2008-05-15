# <URL:http://code.google.com/apis/chart/#line_bar_pie_colors>
module GoogleChart
  module Colors
    def self.included(klass)
      klass.register!(:color)
    end
    
    attr_writer :color
    
    def color
      'chco=' + [@color].flatten.join(',') if @color
    end
  end
end
