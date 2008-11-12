require File.dirname(__FILE__) + '/../test_helper'

class TestSizes < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Sizes }
  end
  
  should 'have a default size' do
    assert_match(/\bchs=600x500\b/, @klass.new.to_url)
  end
  
  should 'accept custom size' do
    assert_match(/\bchs=800x375\b/, @klass.new(:size => '800x375').to_url)
  end
end
