module GoogleChart
  module LineStyle
    def self.included(klass)
      klass.register!(:style)
    end
    
    @@styles = {:solid => [1,1,0], :dash => [1,3,2], :dot => [1,1,2]}
    
    @@default_style = :solid
    @@default_width = 1
    
    def width=(width)
      @width = [width].flatten
    end
    
    def style=(style)
      @style = [style].flatten
    end
    
    def style
      @style ||= []
      @width ||= []
      
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
