require File.dirname(__FILE__) + '/../test_helper'

class TestData < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Data }
  end
  
  should 'use simple encoding by default' do
    assert_match(/\bchd=s:AB89\b/, @klass.new(:data => [0, 1, 60, 61]).to_url)
  end
  
  should 'raise an ArgumentError if data set is empty' do
    assert_raise(ArgumentError, /1 non-nil value/) { @klass.new(:data => []) }
  end
  
  should 'raise an ArgumentError if data set contains only nils' do
    assert_raise(ArgumentError, /1 non-nil value/) { @klass.new(:data => [nil, nil]) }
  end
  
  should 'not raise an ArgumentError if only one of many data sets contains only nils' do
    assert_nothing_raised(ArgumentError) { @klass.new(:data => [[nil, nil], [nil, 1]]) }
  end
  
  should 'auto-scale between 0 and maximum value among all data sets' do
    assert_match(/\bchd=s:67,89\b/, @klass.new(:data => [[58, 59], [60, 61]]).to_url)
  end
  
  should 'be able to auto-scale data sets with nils' do
    assert_match(/\bchd=s:A_9\b/, @klass.new(:data => [0, nil, 100]).to_url)
  end
  
  should 'be able to auto-scale data sets with one empty set' do
    assert_match(/\bchd=s:__,A9\b/, @klass.new(:data => [[nil, nil], [0, 100]]).to_url)
  end
  
  should 'encode data with high-pass filter when auto-scaling' do
    assert_match(/\bchd=s:AAB89\b/, @klass.new(:data => [-1, 0, 1, 60, 61]).to_url)
  end
  
  should 'encode data with band-pass filter when manual-scaling' do
    assert_match(/\bchd=s:AB899\b/, @klass.new(:data => [-5, -1, 99, 100, 102], :scale => -3..100).to_url)
  end
  
  context 'simple encoding' do
    setup { @chart = @klass.new(:encoding => :simple) }
    
    should 'encode dataset with auto-scaling' do
      @chart.data = [0, 15, 10]
      assert_match(/\bchd=s:A9o\b/, @chart.to_url)
    end
    
    should 'encode dataset with manual scaling' do
      @chart.data = [0, 15, 10]
      @chart.scale = 0..20
      assert_match(/\bchd=s:Ate\b/, @chart.to_url)
    end
    
    should 'encode multiple datasets' do
      @chart.data = [[9, 15], [24, 7]]
      @chart.scale = 0..61
      assert_match(/\bchd=s:JP,YH\b/, @chart.to_url)
    end
    
    should 'encode floating point data' do
      @chart.data = [50.5, 33.4]
      @chart.scale = 0..61
      assert_match(/\bchd=s:yh\b/, @chart.to_url)
    end
    
    should 'encode missing data' do
      @chart.data = [50, nil, 33]
      @chart.scale = 0..61
      assert_match(/\bchd=s:y_h\b/, @chart.to_url)
    end
  end
  
  context 'extended encoding' do
    setup { @chart = @klass.new(:encoding => :extended) }
    
    should 'encode dataset with auto-scaling' do
      @chart.data = [0, 15, 10]
      assert_match(/\bchd=e:AA\.\.qq\b/, @chart.to_url)
    end
    
    should 'encode dataset with manual scaling' do
      @chart.data = [15, 10, 0]
      @chart.scale = 0..20
      assert_match(/\bchd=e:v\.f\.AA\b/, @chart.to_url)
    end
    
    should 'encode multiple datasets' do
      @chart.data = [[2281, 3233], [591, 1543]]
      @chart.scale = 0..4095
      assert_match(/\bchd=e:jpyh,JPYH\b/, @chart.to_url)
    end
    
    should 'encode floating point data' do
      @chart.data = [2281.49, 3233.50]
      @chart.scale = 0..4095
      assert_match(/\bchd=e:jpyh\b/, @chart.to_url)
    end
    
    should 'encode missing data' do
      @chart.data = [2281, nil, 3233]
      @chart.scale = 0..4095
      assert_match(/\bchd=e:jp__yh\b/, @chart.to_url)
    end
  end
  
  context 'text encoding' do
    setup { @chart = @klass.new(:encoding => :text) }
    
    should 'encode dataset with auto-scaling' do
      @chart.data = [0, 15, 10]
      assert_match(/\bchd=t:0,100,66.7\b/, @chart.to_url)
    end
    
    should 'encode dataset with manual scaling' do
      @chart.data = [0, 15, 10]
      @chart.scale = 0..20
      assert_match(/\bchd=t:0,75,50\b/, @chart.to_url)
    end
    
    should 'encode multiple datasets' do
      @chart.data = [[6, 14], [5, 23]]
      @chart.scale = 0..100
      assert_match(/\bchd=t:6,14\|5,23\b/, @chart.to_url)
    end
    
    should 'rounds floating point data to the nearest tenth' do
      @chart.data = [5.95, 14.01, 5.23]
      @chart.scale = 0..100
      assert_match(/\bchd=t:6,14,5.2\b/, @chart.to_url)
    end
    
    should 'encode missing data' do
      @chart.data = [6, nil, 14]
      @chart.scale = 0..100
      assert_match(/\bchd=t:6,-1,14\b/, @chart.to_url)
    end
  end
end
