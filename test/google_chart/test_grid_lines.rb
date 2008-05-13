require File.dirname(__FILE__) + '/../test_helper'

class TestGridLines < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::GridLines }
  end
  
  def test_should_add_grid_to_parameter_registry
    assert @klass.registry.include?(:grid)
  end
  
  def test_should_not_display_grid_lines_by_default
    assert_nil(@klass.new.grid)
  end
  
  def test_should_be_able_to_display_vertical_grid_lines
    assert_equal('chg=5,0', @klass.new(:grid => {:x => 5}).grid)
  end
  
  def test_should_be_able_to_display_horizontal_grid_lines
    assert_equal('chg=0,5', @klass.new(:grid => {:y => 5}).grid)
  end
  
  def test_should_be_able_to_display_horizontal_and_vertical_grid_lines
    assert_equal('chg=6,14', @klass.new(:grid => {:x => 6, :y => 14}).grid)
  end
  
  def test_should_be_able_to_specify_solid_grid_line_style
    assert_equal('chg=8,16,1,0', @klass.new(:grid => {:x => 8, :y => 16, :style => :solid}).grid)
  end
  
  def test_should_be_able_to_specify_dot_grid_line_style
    assert_equal('chg=8,16,1,2', @klass.new(:grid => {:x => 8, :y => 16, :style => :dot}).grid)
  end
  
  def test_should_be_able_to_specify_dash_grid_line_style
    assert_equal('chg=8,16,3,2', @klass.new(:grid => {:x => 8, :y => 16, :style => :dash}).grid)
  end
end
