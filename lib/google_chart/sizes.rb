# Specify chart size with chs=<width in pixels>x<height in pixels>
# 
# For example, chs=300x200 generates a chart 300 pixels wide and 200 pixels high.
# The largest possible area for all charts except maps is 300,000 pixels. As the
# maximum height or width is 1000 pixels, examples of maximum sizes are 1000x300,
# 300x1000, 600x500, 500x600, 800x375, and 375x800.
# 
# For maps, the maximum size is 440 pixels wide by 220 pixels high.
# Pie charts are clipped (only partially visible) if the size specified is too
# small. General size guidelines for pie charts are:
# 
# - a two-dimensional chart needs to be roughly twice as wide as it is high.
# - a three-dimensional chart needs to be roughly two and a half times wider than it is high.

module GoogleChart
  module Sizes
    attr_writer :size
    
    @@default_size = '600x500'
    
    def size
      'chs=' + (@size ? @size : @@default_size)
    end
  end
end
