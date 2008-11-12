$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'cgi'

require 'google_chart/abstract_chart'
require 'google_chart/color'
require 'google_chart/data'
require 'google_chart/line_style'
require 'google_chart/title'

require 'google_chart/bar'
require 'google_chart/line'

module GoogleChart
  VERSION = '0.5.0'
end