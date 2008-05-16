require File.dirname(__FILE__) + '/../test_helper'

class TestBase < Test::Unit::TestCase
  def test_descendents_of_base_should_have_chart_type_registered
    klass = Class.new(GoogleChart::Base)
    assert_raise(NoMethodError, /chart_type/) { klass.new.to_url }
    klass.class_eval { define_method(:chart_type) { } }
    assert_nothing_raised { klass.new.to_url }
  end
  
  def test_descendents_of_base_should_have_distinct_repositories
    klass = Class.new(GoogleChart::Base)
    another_klass = Class.new(GoogleChart::Base)
    assert_not_same(another_klass.registry, klass.registry)
  end
  
  def test_to_url_should_start_with_google_base_url
    klass = Class.new(GoogleChart::Base) { define_method(:chart_type) { } }
    assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, klass.new.to_url)
  end
end
