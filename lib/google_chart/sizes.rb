# <URL:http://code.google.com/apis/chart/#chart_size>
module GoogleChart
  module Sizes
    def self.included(klass)
      klass.register!(:size)
    end
    
    attr_writer :size
    
    @@default_size = '600x500'
    
    def size
      'chs=' + (@size ? @size : @@default_size)
    end
  end
end
