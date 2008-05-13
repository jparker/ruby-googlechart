require File.dirname(__FILE__) + '/../test_helper'

class TestBase < Test::Unit::TestCase
  def test_descendents_of_base_should_have_distinct_repositories
    klass = Class.new(GoogleChart::Base)
    another_klass = Class.new(GoogleChart::Base)
    assert_not_same(another_klass.registry, klass.registry)
  end
  
  def test_to_url_should_start_with_google_base_url
    klass = Class.new(GoogleChart::Base)
    assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, klass.new.to_url)
  end
end
