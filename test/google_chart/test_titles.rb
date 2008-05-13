require File.dirname(__FILE__) + '/../test_helper'

class TestTitles < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::Titles }
  end
  
  def test_should_add_title_to_parameter_registry
    assert @klass.registry.include?(:title)
  end
  
  def test_should_not_have_a_title_by_default
    assert_nil(@klass.new.title)
  end
  
  def test_should_accept_and_properly_encode_title
    assert_equal('chtt=foo+bar', @klass.new(:title => 'foo bar').title)
  end
end
