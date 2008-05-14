require File.dirname(__FILE__) + '/../test_helper'

class TestLine < Test::Unit::TestCase
  def test_should_have_default_chart_type
    assert_equal('cht=lc', GoogleChart::Line.new.chart_type)
  end
  
  def test_should_accept_xy_as_chart_type
    assert_equal('cht=lxy', GoogleChart::Line.new(:type => :xy).chart_type)
  end
  
  def test_should_accept_sparkline_as_chart_type
    assert_equal('cht=ls', GoogleChart::Line.new(:type => :sparkline).chart_type)
  end
  
  def test_should_accept_line_as_chart_type
    assert_equal('cht=lc', GoogleChart::Line.new(:type => :line).chart_type)
  end
  
  def test_should_include_axes_module
    assert GoogleChart::Line.include?(GoogleChart::Axes)
  end
  
  def test_should_include_colors_module
    assert GoogleChart::Line.include?(GoogleChart::Colors)
  end
  
  def test_should_include_data_module
    assert GoogleChart::Line.include?(GoogleChart::Data)
  end
  
  def test_should_include_grid_lines_module
    assert GoogleChart::Line.include?(GoogleChart::GridLines)
  end
  
  def test_should_include_legends_module
    assert GoogleChart::Line.include?(GoogleChart::Legends)
  end
  
  def test_should_include_line_styles_module
    assert GoogleChart::Line.include?(GoogleChart::LineStyles)
  end
  
  def test_should_include_range_markers_module
    assert GoogleChart::Line.include?(GoogleChart::RangeMarkers)
  end
  
  def test_should_include_sizes_module
    assert GoogleChart::Line.include?(GoogleChart::Sizes)
  end
  
  def test_should_include_titles_module
    assert GoogleChart::Line.include?(GoogleChart::Titles)
  end
end
