$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'cgi'

require 'google_chart/axis'
require 'google_chart/bar_style'
require 'google_chart/color'
require 'google_chart/data'
require 'google_chart/grid_line'
require 'google_chart/legend'
require 'google_chart/line_style'
require 'google_chart/range_marker'
require 'google_chart/title'

require 'google_chart/base'
require 'google_chart/bar'
require 'google_chart/line'

module GoogleChart
  VERSION = '0.5.0'
  
  def self.Line(options = {}, &block)
    GoogleChart::Line.new(options, &block).to_url
  end
  
  def self.Bar(options = {}, &block)
    GoogleChart::Bar.new(options, &block).to_url
  end
end
