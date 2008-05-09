module GoogleChart
  module Colors
    def self.included(klass)
      klass.register! :colors => 'chco' unless klass == GoogleChart::Base
    end
    
    @@colors = {
      :red      => 'ff0000',
      :green    => '00ff00',
      :blue     => '0000ff',
      :cyan     => '00ffff',
      :magenta  => 'ff00ff',
      :yellow   => 'ffff00',
      :black    => '000000',
      :white    => 'ffffff'
    }
    
    protected
    # Returns the chart colors, if any.
    def colors
      @colors
    end
    
    # Sets the chart colors. +colors+ can be a String/Symbol or Array. Colors
    # may be given as hexadecimal color codes, e.g., ff0000, but can also be
    # given by name in which case it is looked up in @@colors.
    def colors=(colors)
      if colors
        @colors = [colors].flatten.collect {|c| @@colors[c] || c }.join(',')
      end
    end
  end
end
