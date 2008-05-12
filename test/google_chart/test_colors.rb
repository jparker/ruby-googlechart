require File.dirname(__FILE__) + '/../test_helper'

FooChart.class_eval { include GoogleChart::Colors }

class TestColors < Test::Unit::TestCase
  def test_should_not_have_a_color_by_default
    assert_nil(FooChart.new.color)
  end
  
  def test_should_accept_a_single_color
    assert_equal('chco=ff0000', FooChart.new(:color => 'ff0000').color)
  end
  
  def test_should_accept_multiple_colors
    assert_equal('chco=ff0000,00ff00', FooChart.new(:color => %w[ff0000 00ff00]).color)
  end
end
