require File.dirname(__FILE__) + '/../test_helper'

class TestRangeMarkers < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::RangeMarkers }
  end
  
  def test_should_not_have_range_markers_by_default
    assert_nil(@klass.new.ranges)
  end
  
  def test_should_be_able_to_display_horizontal_range
    assert_equal('chm=r,000000cc,x,0.45,0.55', @klass.new(:ranges => [:h, 0.45, 0.55]).ranges)
  end
  
  def test_should_be_able_to_display_vertical_range
    assert_equal('chm=R,000000cc,x,0.45,0.55', @klass.new(:ranges => [:v, 0.45, 0.55]).ranges)
  end
  
  def test_should_be_able_to_display_multiple_ranges
    assert_equal 'chm=r,000000cc,x,0.1,0.2|R,000000cc,x,0.3,0.4',
      @klass.new(:ranges => [[:h, 0.1, 0.2], [:v, 0.3, 0.4]]).ranges
  end
  
  def test_should_be_able_to_specify_range_color
    assert_equal('chm=r,abcdef,x,0.4,0.6', @klass.new(:ranges => [:h, 'abcdef', 0.4, 0.6]).ranges)
  end
end
