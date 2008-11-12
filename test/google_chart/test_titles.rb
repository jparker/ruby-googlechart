require File.dirname(__FILE__) + '/../test_helper'

class TestTitles < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Titles }
  end
  
  should 'not have a title by default' do
    assert_no_match(/\bchtt=/, @klass.new.to_url)
  end
  
  should 'url-encode title' do
    assert_match(/\bchtt=foo\+bar\b/, @klass.new(:title => 'foo bar').to_url)
  end
end
