require 'test/unit'
require 'rubygems'
require 'shoulda'
require File.dirname(__FILE__) + '/../lib/google_chart'

class MockChart < GoogleChart::AbstractChart
  def chart_type
    'cht=mock'
  end
end
