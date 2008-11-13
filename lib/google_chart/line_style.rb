# <URL:http://code.google.com/apis/chart/#line_styles>
module GoogleChart
  module LineStyle
    def self.included(klass)
      klass.register!(:style)
    end
    
    @@styles = { :solid => [1,1,0], :dash => [1,3,2], :dot => [1,1,2] }
    
    @@default_style = :solid
    @@default_width = 1
    
    def style=(style)
      @style = [style].flatten
    end
    
    def width=(width)
      @width = [width].flatten
    end
    
    def style
      @style ||= []
      @width ||= []
      
      # Pad @style and @width with defaults until they are equal in length
      (@style.size - @width.size).times { @width << @@default_width }
      (@width.size - @style.size).times { @style << @@default_style }
      
      unless @style.empty?
        'chls=' + (0...@style.size).map {|i|
          @@styles[@style[i]].map {|n| n * @width[i] }.join(',')
        }.join('|')
      end
    end
  end
end
