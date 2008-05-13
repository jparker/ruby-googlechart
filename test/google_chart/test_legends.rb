require File.dirname(__FILE__) + '/../test_helper'

class TestLegends < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::Legends }
  end
  
  def test_should_add_legend_to_parameter_registry
    assert @klass.registry.include?(:legend)
  end
  
  def test_should_not_display_legend_by_default
    assert_nil(@klass.new.legend)
  end
  
  def test_should_be_able_to_display_legend_for_single_dataset
    assert_equal('chdl=Foo', @klass.new(:legend => 'Foo').legend)
  end
  
  def test_should_be_able_to_display_legend_for_multiple_datasets
    assert_equal('chdl=Foo|Bar|Baz', @klass.new(:legend => %w[Foo Bar Baz]).legend)
  end
  
  def test_should_correctly_escape_legend_for_url
    assert_equal('chdl=Foo+Bar', @klass.new(:legend => 'Foo Bar').legend)
  end
end
