require File.dirname(__FILE__) + '/../test_helper'

class TestBar < Test::Unit::TestCase
  def test_should_have_default_chart_type
    assert_equal('cht=bvs', GoogleChart::Bar.new.chart_type)
  end
  
  def test_should_accept_horizontal_as_orientation
    assert_equal('cht=bhs', GoogleChart::Bar.new(:horizontal => true).chart_type)
  end
  
  def test_should_accept_grouped_as_grouping
    assert_equal('cht=bvg', GoogleChart::Bar.new(:grouped => true).chart_type)
  end
  
  def test_should_include_axes_module
    assert GoogleChart::Bar.include?(GoogleChart::Axes)
  end
  
  def test_should_include_bar_styles_module
    assert GoogleChart::Bar.include?(GoogleChart::BarStyles)
  end
  
  def test_should_include_colors_module
    assert GoogleChart::Bar.include?(GoogleChart::Colors)
  end
  
  def test_should_include_data_module
    assert GoogleChart::Bar.include?(GoogleChart::Data)
  end
  
  def test_should_include_grid_lines_module
    assert GoogleChart::Bar.include?(GoogleChart::GridLines)
  end
  
  def test_should_include_legends_module
    assert GoogleChart::Bar.include?(GoogleChart::Legends)
  end
  
  def test_should_include_range_markers_module
    assert GoogleChart::Bar.include?(GoogleChart::RangeMarkers)
  end
  
  def test_should_include_sizes_module
    assert GoogleChart::Bar.include?(GoogleChart::Sizes)
  end
  
  def test_should_include_titles_module
    assert GoogleChart::Bar.include?(GoogleChart::Titles)
  end
end
