require 'matrix'

module GoogleChart
  class BarChart < AbstractChart
    include Axis
    include BarStyle
    include Color
    include Data
    include GridLine
    include Legend
    include RangeMarker
    include Title
    
    @@orientations = {:horizontal => 'h', :vertical => 'v'}
    @@groupings    = {:group => 'g', :stack => 's', :overlap => 's'}
    
    attr_writer :orientation, :grouping
    
    def horizontal=(arg)
      self.orientation = arg ? :horizontal : :vertical
    end
    
    def chart_type
      @grouping    ||= :group
      @orientation ||= :vertical
      "cht=b#{@@orientations[@orientation]}#{@@groupings[@grouping]}"
    end
    
    private
    def reduce(data)
      if @grouping == :overlap
        # FIXME: This is really ugly!
        (data.size - 1).downto(1) do |i|
          data[i].size.times do |j|
            data[i][j] -= data[0...i].map {|set|
              set[j].nil? || set[j] < 0 ? 0 : set[j]
            }.sum
          end
        end
        data
      else
        super
      end
    end
    
    def set_scale
      if @grouping == :stack
        if @scale.nil? && !@data.nil?
          min = [0, @data.map {|set| set.compact.min }.compact.min].max
          max = Matrix[*@data].column_vectors.map {|v| v.to_a.compact.sum }.max
          @scale = min..max
        end
      end
      super
    end
  end
end
