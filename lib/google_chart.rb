$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module GoogleChart
  
end

require 'google_chart/sizes'
require 'google_chart/data'
require 'google_chart/colors'
require 'google_chart/titles'
