require File.dirname(__FILE__) + '/../test_helper'

class TestAxes < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::Axes }
  end
  
  def test_should_not_display_axes_by_default
    assert_nil(@klass.new.axes)
  end
  
  # axis types
  def test_should_be_able_to_display_bottom_x_axis
    assert_equal('chxt=x', @klass.new(:axes => {:x => true}).axes)
  end
  
  def test_should_be_able_to_display_top_x_axis
    assert_equal('chxt=t', @klass.new(:axes => {:t => true}).axes)
  end
  
  def test_should_be_able_to_display_left_y_axis
    assert_equal('chxt=y', @klass.new(:axes => {:y => true}).axes)
  end
  
  def test_should_be_able_to_display_right_y_axis
    assert_equal('chxt=r', @klass.new(:axes => {:r => true}).axes)
  end
  
  def test_should_be_able_to_display_multiple_axes
    assert_equal('chxt=x,y,r', @klass.new(:axes => {:x => true, :y => true, :r => true}).axes)
  end
  
  # axis labels
  def test_should_be_able_to_display_enumerated_axis_labels
    assert_equal('chxt=x&chxl=0:|foo|bar|baz', @klass.new(:axes => {:x => %w[foo bar baz]}).axes)
  end
  
  def test_should_be_able_to_display_enumerated_axis_labels_for_multiple_axes
    assert_equal('chxt=x,y&chxl=0:|foo|bar|baz|1:|0|5|10', @klass.new(:axes => {:x => %w[foo bar baz], :y => %w[0 5 10]}).axes)
  end
  
  def test_should_correctly_escape_labels_for_url
    assert_match(/chxl=0:\|foo\+bar\|baz%7Cfroz/, @klass.new(:axes => {:x => ['foo bar', 'baz|froz']}).axes)
  end
  
  # axis label positions
  
  # axis ranges
  def test_should_be_able_to_display_axis_label_ranges
    assert_equal('chxt=x&chxr=0,8,16', @klass.new(:axes => {:x => 8..16}).axes)
  end
  
  def test_should_be_able_to_display_multiple_axis_label_ranges
    assert_equal('chxt=x,y&chxr=0,6,14|1,8,16', @klass.new(:axes => {:x => 6..14, :y => 8..16}).axes)
  end
  
  # mixed axis labels
  def test_should_be_able_to_display_multiple_types_of_axis_labels
    assert_equal('chxt=x,y,r&chxl=0:|foo|bar|baz&chxr=2,6,14', @klass.new(:axes => {:x => %w[foo bar baz], :y => true, :r => 6..14}).axes)
  end
end
