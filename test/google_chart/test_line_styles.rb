require File.dirname(__FILE__) + '/../test_helper'

FooChart.class_eval { include GoogleChart::LineStyles }

class TestLineStyles < Test::Unit::TestCase
  def test_should_not_have_line_styles_by_default
    assert_nil(FooChart.new.style)
  end
  
  def test_should_be_able_to_provide_solid_line_style
    assert_equal('chls=1,1,0', FooChart.new(:style => :solid).style)
  end
  
  def test_should_be_able_to_provide_dash_line_style
    assert_equal('chls=1,3,2', FooChart.new(:style => :dash).style)
  end
  
  def test_should_be_able_to_provide_dot_line_style
    assert_equal('chls=1,1,2', FooChart.new(:style => :dot).style)
  end
  
  def test_should_be_able_to_provide_multiple_line_styles
    assert_equal('chls=1,3,2|1,1,2|1,1,0', FooChart.new(:style => [:dash, :dot, :solid]).style)
  end
  
  def test_should_be_able_to_provide_line_width
    assert_equal('chls=2,2,0', FooChart.new(:width => 2).style)
  end
  
  def test_should_be_able_to_provide_line_width_and_line_style
    assert_equal('chls=2,6,4', FooChart.new(:style => :dash, :width => 2).style)
  end
  
  def test_should_be_able_to_provide_multiple_line_widths_and_line_styles
    assert_equal('chls=2,2,4|3,9,6', FooChart.new(:style => [:dot, :dash], :width => [2, 3]).style)
  end
  
  def test_should_use_default_line_width_when_there_are_more_styles_than_widths
    assert_equal('chls=2,2,4|1,3,2|1,1,0', FooChart.new(:style => [:dot, :dash, :solid], :width => 2).style)
  end
  
  def test_should_use_default_line_style_when_there_are_more_widths_than_styles
    assert_equal('chls=2,2,4|3,3,0|2,2,0', FooChart.new(:style => :dot, :width => [2, 3, 2]).style)
  end
end
