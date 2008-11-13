require File.dirname(__FILE__) + '/../test_helper'

class TestBarStyle < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::BarStyle }
  end
  
  should 'not display bar style parameter by default' do
    assert_no_match(/\bchbh=/, @klass.new.to_url)
  end
  
  should 'display with custom bar width' do
    assert_match(/\bchbh=10\b/, @klass.new(:width => 10).to_url)
  end
  
  should 'display with custom bar width and spacing' do
    assert_match(/\bchbh=8,6\b/, @klass.new(:width => 8, :spacing => 6).to_url)
  end
  
  should 'display with custom bar width, spacing and group spacing' do
    assert_match(/\bchbh=10,4,12\b/, @klass.new(:width => 10, :spacing => [4,12]).to_url)
  end
end
