module GoogleChart
  module LineStyles
    def self.included(klass)
      unless klass == GoogleChart::Base
        klass.register! :styles => 'chls'
      end
    end
    
    @@line_styles = { :solid => [1,1,0], :dash => [1,3,2], :dot => [1,1,2] }
    
    protected
    def styles
      @styles ||= []
      @widths ||= []
      
      (@styles.size - @widths.size).times { @widths << 1 }
      (@widths.size - @styles.size).times { @styles << @@line_styles[:solid] }
      
      s = []
      @widths.each_with_index do |width, i|
        s << @styles[i].collect {|n| n * width }.join(',')
      end
      
      s.join('|') unless s.empty?
    end
    
    def styles=(styles)
      @styles = [styles].flatten.collect {|s| @@line_styles[s] }
    end
    
    def width=(width)
      @widths = [width].flatten
    end
  end
end
