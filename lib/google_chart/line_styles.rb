module GoogleChart
  module LineStyles
    def self.included(klass)
      unless klass == GoogleChart::Base
        klass.register! :style => 'chls'
      end
    end
    
    @@default_line_style = :solid
    @@default_line_width = 1
    @@line_styles = { :solid => [1,1,0], :dash => [1,3,2], :dot => [1,1,2] }
    
    protected
    # Returns the line style parameters, if any. Width and style go into the
    # same API parameter (chls). Line styles are provided as a width, length
    # of line segment and lenght of gap between segments. The named styles are
    # based on the unit width, but if a width is provided by the user, the gap
    # and segment lengths are multiplied by the given width to retain a
    # consistent appearance.
    def style
      @style ||= []
      @width ||= []
      
      # Pad @style and @width with defaults until they are the same length
      (@style.size - @width.size).times { @width << @@default_line_width }
      (@width.size - @style.size).times { @style << @@line_styles[@@default_line_style] }
      
      unless @style.empty?
        (0...@style.size).collect {|i|
          @style[i].collect {|n| n * @width[i] }.join(',')
        }.join('|')
      end
    end
    
    # Looks up the named line styles and stores them.
    def style=(style)
      @style = [style].flatten.collect {|s| @@line_styles[s] }
    end
    
    # Stores the line widths.
    def width=(width)
      @width = [width].flatten
    end
  end
end
