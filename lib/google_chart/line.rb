module GoogleChart
  class Line < AbstractChart
    include Axis
    include Color
    include Data
    include GridLine
    include Legend
    include LineStyle
    include RangeMarker
    include Title
    
    @@types = {:line => 'lc', :xy => 'lxy', :spark => 'ls'}
    
    attr_writer :type
    
    def type
      @type ||= :line
      "cht=#{@@types[@type]}"
    end
  end
end
