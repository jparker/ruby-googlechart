require File.dirname(__FILE__) + '/../test_helper'

TestChart.class_eval do
  include GoogleChart::GridLines
end

class TestGoogleChartGridLines < Test::Unit::TestCase
  def test_should_not_have_grid_lines_by_default
    assert_no_match(/\bchg=/, TestChart.new.to_url)
  end
  
  def test_should_be_able_to_display_x_axis_grid_lines
    assert_match(/\bchg=10,0\b/, TestChart.new(:grids => {:x => 10}).to_url)
  end
  
  def test_should_be_able_to_display_y_axis_grid_lines
    assert_match(/\bchg=0,15\b/, TestChart.new(:grids => {:y => 15}).to_url)
  end
  
  def test_should_be_able_to_display_grid_lines_for_both_axes
    assert_match(/\bchg=6,14\b/, TestChart.new(:grids => {:x => 6, :y => 14}).to_url)
  end
  
  def test_should_be_able_to_specify_dotted_grid_line_style
    assert_match(/\bchg=0,10,1,2\b/, TestChart.new(:grids => {:y => 10, :style => :dot}).to_url)
  end
  
  def test_should_be_able_to_specify_solid_grid_line_style
    assert_match(/\bchg=0,10,1,0\b/, TestChart.new(:grids => {:y => 10, :style => :solid}).to_url)
  end
  
  def test_should_be_able_to_specify_dashed_grid_line_style
    assert_match(/\bchg=0,10,3,2\b/, TestChart.new(:grids => {:y => 10, :style => :dash}).to_url)
  end
end
