module GoogleChart
  class Line < AbstractChart
    include Color
    include Title
    
    @@types = {:line => 'lc', :xy => 'lxy', :spark => 'ls'}
    
    attr_writer :type
    
    def type
      @type ||= :line
      "cht=#{@@types[@type]}"
    end
  end
end
