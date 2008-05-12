require File.dirname(__FILE__) + '/../test_helper'

FooChart.class_eval { include GoogleChart::Sizes }

class TestSizes < Test::Unit::TestCase
  def test_should_have_a_default_size
    assert_equal('chs=600x500', FooChart.new.size)
  end
  
  def test_should_accept_a_custom_size
    assert_equal('chs=800x375', FooChart.new(:size => '800x375').size)
  end
end
