require File.dirname(__FILE__) + '/../test_helper'

class TestRangeMarker < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::RangeMarker }
  end
  
  should 'not have range markers by default' do
    assert_no_match(/\bchm=/, @klass.new.to_url)
  end
  
  should 'display horizontal range markers' do
    assert_match(/\bchm=r,000000cc,x,0.45,0.55\b/, @klass.new(:ranges => [:h, 0.45, 0.55]).to_url)
  end
  
  should 'display vertical range markers' do
    assert_match(/\bchm=R,000000cc,x,0.45,0.55\b/, @klass.new(:ranges => [:v, 0.45, 0.55]).to_url)
  end
  
  should 'display multiple range markers' do
    assert_match(/\bchm=r,000000cc,x,0.1,0.2\|R,000000cc,x,0.3,0.4\b/, @klass.new(:ranges => [[:h, 0.1, 0.2], [:v, 0.3, 0.4]]).to_url)
  end
  
  should 'display range markers with custom colors' do
    assert_match(/\bchm=r,abcdef,x,0.4,0.6\b/, @klass.new(:ranges => [:h, 'abcdef', 0.4, 0.6]).to_url)
  end
end
