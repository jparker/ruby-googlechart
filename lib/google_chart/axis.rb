# <URL:http://code.google.com/apis/chart/#multiple_axes_labels>
module GoogleChart
  module Axis
    def self.included(klass)
      klass.register!(:axes)
    end
    
    # TODO: Add support for axis label positions/styles, support for multiple label sets per axis
    
    def axes=(axes)
      idx = 0
      @axes, @axis_labels, @axis_ranges = [], [], []
      [:x, :y, :r, :t].each do |axis|
        case axes[axis]
        when Array
          @axis_labels << ("#{idx}:|" + axes[axis].map {|l| CGI::escape(l.to_s) }.join('|'))
          @axes << axis
          idx += 1
        when Range
          @axis_ranges << ("#{idx},#{axes[axis].first},#{axes[axis].last}")
          @axes << axis
          idx += 1
        when true
          @axes << axis
          idx += 1
        end
      end
    end
    
    def axes
      unless @axes.nil? || @axes.empty?
        [
          'chxt=' + @axes.join(','),
          @axis_labels.empty? ? nil : 'chxl=' + @axis_labels.join('|'),
          @axis_ranges.empty? ? nil : 'chxr=' + @axis_ranges.join('|')
        ].compact.join('&')
      end
    end
  end
end
