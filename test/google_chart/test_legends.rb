require File.dirname(__FILE__) + '/../test_helper'

FooChart.class_eval { include GoogleChart::Legends }

class TestLegends < Test::Unit::TestCase
  def test_should_not_display_legend_by_default
    assert_nil(FooChart.new.legend)
  end
  
  def test_should_be_able_to_display_legend_for_single_dataset
    assert_equal('chdl=Foo', FooChart.new(:legend => 'Foo').legend)
  end
  
  def test_should_be_able_to_display_legend_for_multiple_datasets
    assert_equal('chdl=Foo|Bar|Baz', FooChart.new(:legend => %w[Foo Bar Baz]).legend)
  end
  
  def test_should_correctly_escape_legend_for_url
    assert_equal('chdl=Foo+Bar', FooChart.new(:legend => 'Foo Bar').legend)
  end
end
