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

require 'google_chart/abstract_chart'
require 'google_chart/bar_chart'
require 'google_chart/line_chart'

module GoogleChart
  def self.Line(options = {}, &block)
    GoogleChart::LineChart.new(options, &block).to_url
  end
  
  def self.Bar(options = {}, &block)
    GoogleChart::BarChart.new(options, &block).to_url
  end
end
