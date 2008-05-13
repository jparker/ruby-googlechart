require File.dirname(__FILE__) + '/../test_helper'

class TestColors < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::Colors }
  end
  
  def test_should_add_color_to_parameter_registry
    assert @klass.registry.include?(:color)
  end
  
  def test_should_not_have_a_color_by_default
    assert_nil(@klass.new.color)
  end
  
  def test_should_accept_a_single_color
    assert_equal('chco=ff0000', @klass.new(:color => 'ff0000').color)
  end
  
  def test_should_accept_multiple_colors
    assert_equal('chco=ff0000,00ff00', @klass.new(:color => %w[ff0000 00ff00]).color)
  end
end
