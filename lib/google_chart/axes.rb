module GoogleChart
  module Axes
    def self.included(klass)
      unless klass == GoogleChart::Base
        klass.register! :axes => 'chxt', :axis_labels => 'chxl', :axis_ranges => 'chxr'
      end
    end
    
    @@axes = { :x => 'x', :y => 'y', :r => 'r', :t => 't' }
    
    protected
    # Returns the list of axes to be displayed, if any.
    def axes
      @axes.join(',') unless @axes.nil?
    end
    
    # Returns the enumerated axis labels to be displayed, if any.
    def axis_labels
      @axis_labels.join('|') unless @axis_labels.nil? || @axis_labels.empty?
    end
    
    # Returns the axis label ranges to be displayed, if any.
    def axis_ranges
      @axis_ranges.join('|') unless @axis_ranges.nil? || @axis_ranges.empty?
    end
    
    # Sets the axes to be displayed and their labels (if any). +axes+ should
    # be a Hash with the axes (x, y, r and/or t) as the keys.
    def axes=(axes)
      idx = 0
      @axes, @axis_labels, @axis_ranges = [], [], []
      
      # Axes are processed in fixed order because the labels are paired with
      # the corresponding axis by index number.
      [:x, :y, :r, :t].each do |axis|
        case axes[axis]
        when Array
          @axis_labels << "#{idx}:|#{axes[axis].join('|')}"
          @axes << @@axes[axis]
          idx += 1
        when Range
          @axis_ranges << "#{idx},#{axes[axis].first},#{axes[axis].last}"
          @axes << @@axes[axis]
          idx += 1
        when true
          @axes << @@axes[axis]
          idx += 1
        end
      end
    end
  end
end
