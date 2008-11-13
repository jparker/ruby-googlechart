# <URL:http://code.google.com/apis/chart/#hor_line_marker>
module GoogleChart
  module RangeMarker
    def self.included(klass)
      klass.register!(:ranges)
    end
    
    @@range_marker_orientations = { :h => 'r', :v => 'R' }
    
    def ranges=(ranges)
      @ranges = ranges.any? {|e| e.is_a?(Array) } ? ranges : [ranges]
    end
    
    def ranges
      unless @ranges.nil? || @ranges.empty?
        'chm=' + @ranges.collect {|r|
          r[0] = @@range_marker_orientations[r[0]]
          r[1..-1] = ['000000cc', *r[1..-1]] if r.size == 3
          # The middle parameter is required by Google Charts but ignored for range markers
          r = r[0..1] + ['x'] + r[2..-1]
          r.join(',')
        }.join('|')
      end
    end
  end
end
