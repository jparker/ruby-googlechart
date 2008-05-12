# Specify colors for lines, bars, Venn diagrams, Google-o-meters, and pie segments with
# chco=
# <color1>,
# ...
# <colorn>
# Where <color1> and all subsequent color values are RRGGBB format hexadecimal numbers.

module GoogleChart
  module Colors
    attr_writer :color
    
    def color
      'chco=' + [@color].flatten.join(',') if @color
    end
  end
end
