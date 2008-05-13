module GoogleChart
  module Legends
    def self.included(klass)
      klass.register!(:legend)
    end
    
    attr_writer :legend
    
    def legend
      'chdl=' + [@legend].flatten.collect {|l| CGI::escape(l) }.join('|') if @legend
    end
  end
end
