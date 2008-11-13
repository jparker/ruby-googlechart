require File.dirname(__FILE__) + '/../test_helper'

class TestBase < Test::Unit::TestCase
  should 'require descendent classes to define #chart_type method' do
    klass = Class.new(GoogleChart::Base)
    assert_raise(NoMethodError, /chart_type/) { klass.new.to_url }
    
    klass.class_eval { def chart_type() end }
    assert_nothing_raised { klass.new.to_url }
  end
  
  should 'allow descendent classes to maintain distinct parameter registries' do
    klass = Class.new(GoogleChart::Base)
    another_klass = Class.new(GoogleChart::Base)
    assert_not_same(another_klass.registry, klass.registry)
  end
  
  should 'begin URLs with Google Charts base URL' do
    assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, Class.new(MockChart).new.to_url)
  end
  
  should 'have a default chart size' do
    assert_match(/\bchs=600x500\b/, Class.new(MockChart).new.to_url)
  end
  
  should 'accept custom chart sizes' do
    assert_match(/\bchs=800x375\b/, Class.new(MockChart).new(:size => '800x375').to_url)
  end
end
