require File.dirname(__FILE__) + '/../test_helper'

class TestLegend < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Legend }
  end
  
  should 'not display legend by default' do
    assert_no_match(/\bchdl=/, @klass.new.to_url)
  end
  
  should 'display legend for single dataset' do
    assert_match(/\bchdl=Foo\b/, @klass.new(:legend => 'Foo').to_url)
  end
  
  should 'display legend for multiple datasets' do
    assert_match(/\bchdl=Foo\|Bar\|Baz\b/, @klass.new(:legend => %w[Foo Bar Baz]).to_url)
  end
  
  should 'escape legend text for url' do
    assert_match(/\bchdl=Foo\+Bar%7CBaz\b/, @klass.new(:legend => 'Foo Bar|Baz').to_url)
  end
  
  should 'convert non-String legend keys to Strings' do
    assert_match(/\bchdl=foo\|\|1\b/, @klass.new(:legend => ['foo', nil, 1]).to_url)
  end
end
