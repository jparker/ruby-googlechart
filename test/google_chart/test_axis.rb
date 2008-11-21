require File.dirname(__FILE__) + '/../test_helper'

class TestAxis < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Axis }
  end
  
  should 'not display axis parameter by default' do
    url = @klass.new.to_url
    assert_no_match(/\bchx[lrt]=/, url)
  end
  
  context 'axis types' do
    should 'display bottom x-axis' do
      assert_match(/\bchxt=x\b/, @klass.new(:axes => {:x => true}).to_url)
    end
    
    should 'display top x-axis' do
      assert_match(/\bchxt=t\b/, @klass.new(:axes => {:t => true}).to_url)
    end
    
    should 'display left y-axis' do
      assert_match(/\bchxt=y\b/, @klass.new(:axes => {:y => true}).to_url)
    end
    
    should 'display right y-axis' do
      assert_match(/\bchxt=r\b/, @klass.new(:axes => {:r => true}).to_url)
    end
    
    should 'display multiple axes' do
      assert_match(/\bchxt=x,y,r\b/, @klass.new(:axes => {:x => true, :y => true, :r => true}).to_url)
    end
  end
  
  context 'axis labels' do
    should 'dsiplay enumerated axis labels' do
      assert_match(/\bchxt=x&chxl=0:\|foo\|bar\|baz\b/, @klass.new(:axes => {:x => %w[foo bar baz]}).to_url)
    end
    
    should 'display enumerated axis labels for multiple axes' do
      assert_match(/\bchxt=x,y&chxl=0:\|foo\|bar\|baz\|1:\|0\|5\|10\b/, @klass.new(:axes => {:x => %w[foo bar baz], :y => %w[0 5 10]}).to_url)
    end
    
    should 'display enumerated axis labels for subset of axes' do
      assert_match(/\bchxt=x,y,r&chxl=0:\|foo\|bar\|2:\|baz\|froz\b/, @klass.new(:axes => {:x => %w[foo bar], :y => true, :r => %w[baz froz]}).to_url)
    end
    
    should 'escape axis labels for url' do
      assert_match(/\bchxl=0:\|foo\+bar\|baz%7Cfroz\b/, @klass.new(:axes => {:x => ['foo bar', 'baz|froz']}).to_url)
    end
    
    should 'convert non-String labels to Strings' do
      assert_match(/\bchxl=0:\|foo\|\|1\b/, @klass.new(:axes => {:x => ['foo', nil, 1]}).to_url)
    end
  end
  
  context 'axis ranges' do
    should 'dsiplay axis label ranges' do
      assert_match(/\bchxt=x&chxr=0,8,16/, @klass.new(:axes => {:x => 8..16}).to_url)
    end
    
    should 'display multiple axis label ranges' do
      assert_match(/\bchxt=x,y&chxr=0,6,14\|1,5,23\b/, @klass.new(:axes => {:x => 6..14, :y => 5..23}).to_url)
    end
    
    should 'display axis label ranges for subset of axes' do
      assert_match(/\bchxr=0,0,5\|2,0,100\b/, @klass.new(:axes => {:x => 0..5, :y => true, :r => 0..100}).to_url)
    end
  end
  
  should 'display multiple types of axis labels' do
    assert_match(/\bchxt=x,y,r&chxl=0:\|foo\|bar\|baz&chxr=2,5,23\b/, @klass.new(:axes => {:x => %w[foo bar baz], :y => true, :r => 5..23}).to_url)
  end
end
