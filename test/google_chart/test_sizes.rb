require File.dirname(__FILE__) + '/../test_helper'

class TestSizes < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::Sizes }
  end
  
  def test_should_add_size_to_parameter_registry
    assert @klass.registry.include?(:size)
  end
  
  def test_should_have_a_default_size
    assert_equal('chs=600x500', @klass.new.size)
  end
  
  def test_should_accept_a_custom_size
    assert_equal('chs=800x375', @klass.new(:size => '800x375').size)
  end
end
