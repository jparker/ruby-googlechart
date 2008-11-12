require File.dirname(__FILE__) + '/../test_helper'

class TestGridLines < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::GridLines }
  end
  
  should 'not display grid lines by default' do
    assert_no_match(/\bchg=/, @klass.new.to_url)
  end
  
  should 'display vertical grid lines' do
    assert_match(/\bchg=5,0\b/, @klass.new(:grid => {:x => 5}).to_url)
  end
  
  should 'display horizontal grid lines' do
    assert_match(/\bchg=0,5\b/, @klass.new(:grid => {:y => 5}).to_url)
  end
  
  should 'display horizontal and vertical grid lines' do
    assert_match(/\bchg=6,14\b/, @klass.new(:grid => {:x => 6, :y => 14}).to_url)
  end
  
  should 'display solid grid lines' do
    assert_match(/\bchg=8,16,1,0\b/, @klass.new(:grid => {:x => 8, :y => 16, :style => :solid}).to_url)
  end
  
  should 'display dashed grid lines' do
    assert_match(/\bchg=8,16,3,2\b/, @klass.new(:grid => {:x => 8, :y => 16, :style => :dash}).to_url)
  end
  
  should 'display dotted grid lines' do
    assert_match(/\bchg=8,16,1,2\b/, @klass.new(:grid => {:x => 8, :y => 16, :style => :dot}).to_url)
  end
end
