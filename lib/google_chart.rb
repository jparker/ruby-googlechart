$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'google_chart/axes'
require 'google_chart/bar_styles'
require 'google_chart/colors'
require 'google_chart/data'
require 'google_chart/grid_lines'
require 'google_chart/legends'
require 'google_chart/line_styles'
require 'google_chart/range_markers'
require 'google_chart/sizes'
require 'google_chart/titles'

require 'google_chart/base'
require 'google_chart/bar'
require 'google_chart/line'

module GoogleChart
  def self.Line(options = {})
    Line.new(options).to_url
  end
  
  def self.Bar(options = {})
    Bar.new(options).to_url
  end
end
