require File.dirname(__FILE__) + '/../test_helper'

class TestGoogleChartLine < Test::Unit::TestCase
  def test_should_descend_from_base
    assert GoogleChart::Line < GoogleChart::Base
  end
  
  def test_should_include_axes_module
    assert GoogleChart::Line.include?(GoogleChart::Axes)
  end
  
  def test_should_have_default_chart_type
    assert_match /\bcht=lc\b/, GoogleChart.Line
  end
  
  def test_should_accept_sparkline_chart_type
    assert_match /\bcht=ls\b/, GoogleChart.Line(:type => :sparkline)
  end
  
  def test_should_accept_xy_chart_type
    assert_match /\bcht=lxy\b/, GoogleChart.Line(:type => :xy)
  end
end
