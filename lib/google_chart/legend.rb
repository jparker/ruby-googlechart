# <URL:http://code.google.com/apis/chart/#chdl>
module GoogleChart
  module Legend
    def self.included(klass)
      klass.register!(:legend)
    end
    
    def legend=(legend)
      @legend = [legend].flatten.map {|l| CGI::escape(l.to_s) }
    end
    
    def legend
      "chdl=#{@legend.join('|')}" if @legend
    end
  end
end
