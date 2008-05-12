require File.dirname(__FILE__) + '/../test_helper'

FooChart.class_eval { include GoogleChart::Titles }

class TestTitles < Test::Unit::TestCase
  def test_should_not_have_a_title_by_default
    assert_nil(FooChart.new.title)
  end
  
  def test_should_accept_and_properly_encode_title
    assert_equal('chtt=foo+bar', FooChart.new(:title => 'foo bar').title)
  end
end
