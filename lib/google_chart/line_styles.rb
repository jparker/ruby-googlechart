module GoogleChart
  module LineStyles
    @@line_styles = { :solid => [1,1,0], :dash => [1,3,2], :dot => [1,1,2] }
    @@default_line_style = :solid
    @@default_line_width = 1
    
    def style
      @style ||= []
      @width ||= []
      
      # Pad @style and @width with defaults until they are equal in length
      (@style.size - @width.size).times { @width << @@default_line_width }
      (@width.size - @style.size).times { @style << @@default_line_style }
      
      unless @style.empty?
        'chls=' + (0...@style.size).collect {|i|
          @@line_styles[@style[i]].collect {|n| n * @width[i] }.join(',')
        }.join('|')
      end
    end
    
    def style=(style)
      @style = [style].flatten
    end
    
    def width=(width)
      @width = [width].flatten
    end
  end
end
