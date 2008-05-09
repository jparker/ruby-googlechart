module GoogleChart
  module Sizes
    def self.included(klass)
      klass.register! :size => 'chs' unless klass == GoogleChart::Base
    end
    
    protected
    # Returns the chart size. Default chart size is 600px wide by 500px tall.
    def size
      @size ||= '600x500'
    end
    
    # Sets the chart size.
    def size=(size)
      @size = size
    end
  end
end
