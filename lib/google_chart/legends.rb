module GoogleChart
  module Legends
    attr_writer :legend
    
    def legend
      'chdl=' + [@legend].flatten.collect {|l| CGI::escape(l) }.join('|') if @legend
    end
  end
end
