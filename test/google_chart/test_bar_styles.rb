require File.dirname(__FILE__) + '/../test_helper'

class TestBarStyles < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::BarStyles }
  end
  
  def test_should_not_have_bar_style_by_default
    assert_nil(@klass.new.style)
  end
  
  def test_should_be_able_to_provide_bar_width
    assert_equal('chbh=10', @klass.new(:width => 10).style)
  end
  
  def test_should_be_able_to_provide_bar_spacing
    assert_equal('chbh=8,6', @klass.new(:width => 8, :spacing => 6).style)
  end
  
  def test_should_be_able_to_provide_bar_spacing_and_group_spacing
    assert_equal('chbh=10,4,12', @klass.new(:width => 10, :spacing => [4, 12]).style)
  end
  
  def test_should_raise_error_if_spacing_is_provided_without_width
    assert_raise(RuntimeError, 'spacing requires width') { @klass.new(:spacing => 10).style }
  end
end
