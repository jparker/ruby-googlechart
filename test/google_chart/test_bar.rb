require File.dirname(__FILE__) + '/../test_helper'

class TestGoogleChartBar < Test::Unit::TestCase
  def test_should_descend_from_base
    assert GoogleChart::Bar < GoogleChart::Base
  end
  
  def test_should_include_axes_module
    assert GoogleChart::Bar.include?(GoogleChart::Axes)
  end
  
  def test_should_include_grid_lines_module
    assert GoogleChart::Bar.include?(GoogleChart::GridLines)
  end
  
  def test_should_have_default_bar_grouping_and_orientation
    assert_match /\bcht=bvs\b/, GoogleChart.Bar
  end
  
  def test_should_accept_horizontal_orientation
    assert_match /\bcht=bhs\b/, GoogleChart.Bar(:horizontal => true)
  end
  
  def test_should_accept_grouped_bar_grouping
    assert_match /\bcht=bvg\b/, GoogleChart.Bar(:grouped => true)
  end
end
