require File.dirname(__FILE__) + '/../test_helper'

class TestLineStyles < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::LineStyles }
  end
  
  should 'not include line styles by default' do
    assert_no_match(/\bchls=/, @klass.new.to_url)
  end
  
  should 'support solid lines' do
    assert_match(/\bchls=1,1,0\b/, @klass.new(:style => :solid).to_url)
  end
  
  should 'support dashed lines' do
    assert_match(/\bchls=1,3,2\b/, @klass.new(:style => :dash).to_url)
  end
  
  should 'support dotted lines' do
    assert_match(/\bchls=1,1,2\b/, @klass.new(:style => :dot).to_url)
  end
  
  should 'support multiple line styles' do
    assert_match(/\bchls=1,3,2\|1,1,2\|1,1,0\b/, @klass.new(:style => [:dash, :dot, :solid]).to_url)
  end
  
  should 'support custom line width' do
    assert_match(/\bchls=2,2,0\b/, @klass.new(:width => 2).to_url)
  end
  
  should 'support named line style with custom width' do
    assert_match(/\bchls=2,6,4\b/, @klass.new(:style => :dash, :width => 2).to_url)
  end
  
  should 'support multiple line styles and multiple custom widths' do
    assert_match(/\bchls=2,2,4\|3,9,6\b/, @klass.new(:style => [:dot, :dash], :width => [2, 3]).to_url)
  end
  
  should 'use default line width if there are more styles than widths' do
    assert_match(/\bchls=2,2,4\|1,3,2\|1,1,0\b/, @klass.new(:style => [:dot, :dash, :solid], :width => 2).to_url)
  end
  
  should 'use default line style if there are more widths than styles' do
    assert_match(/\bchls=2,2,4\|3,3,0\|2,2,0\b/, @klass.new(:style => :dot, :width => [2, 3, 2]).to_url)
  end
end
