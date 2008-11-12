require File.dirname(__FILE__) + '/../test_helper'

class TestData < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Data }
  end
  
  should 'use simple encoding by default' do
    assert_match(/\bchd=s:AB89\b/, @klass.new(:data => [0, 1, 60, 61]).to_url)
  end
  
  context 'simple encoding' do
    setup { @chart = @klass.new(:encoding => :simple) }
    
    should 'encode dataset with auto-scaling' do
      @chart.data = [0, 15, 10]
      assert_match(/\bchd=s:A9p\b/, @chart.to_url)
    end
    
    should 'encode dataset with manual scaling' do
      @chart.data = [0, 15, 10]
      @chart.scale = 0..20
      assert_match(/\bchd=s:Auf\b/, @chart.to_url)
    end
    
    should 'encode multiple datasets' do
      @chart.data = [[9, 15], [24, 7]]
      @chart.scale = 0..61
      assert_match(/\bchd=s:JP,YH\b/, @chart.to_url)
    end
    
    should 'encode missing data' do
      @chart.data = [50, nil, 33]
      @chart.scale = 0..61
      assert_match(/\bchd=s:y_h\b/, @chart.to_url)
    end
    
    should 'encode out-of-bounds data' do
      @chart.data = [62, 61, 60, 1, 0, -1]
      @chart.scale = 0..61
      assert_match(/\bchd=s:998BAA/, @chart.to_url)
    end
    
    should 'encode floating point data' do
      @chart.data = [49.5, 33.4]
      @chart.scale = 0..61
      assert_match(/\bchd=s:yh\b/, @chart.to_url)
    end
  end
  
  context 'extended encoding' do
    setup { @chart = @klass.new(:encoding => :extended) }
    
    should 'encode dataset with auto-scaling' do
      @chart.data = [0, 15, 10]
      assert_match(/\bchd=e:AA\.\.qq\b/, @chart.to_url)
    end
    
    should 'encode dataset with manual scaling' do
      @chart.data = [0, 15, 10]
      @chart.scale = 0..20
      assert_match(/\bchd=e:AAv\.gA\b/, @chart.to_url)
    end
    
    should 'encode multiple datasets' do
      @chart.data = [[2281, 3233], [591, 1543]]
      @chart.scale = 0..4095
      assert_match(/\bchd=e:jpyh,JPYH\b/, @chart.to_url)
    end
    
    should 'encode missing data' do
      @chart.data = [2281, nil, 3233]
      @chart.scale = 0..4095
      assert_match(/\bchd=e:jp__yh\b/, @chart.to_url)
    end
    
    should 'encode out-of-bounds data' do
      @chart.data = [4096, 4095, 4094, 1, 0, -1]
      @chart.scale = 0..4095
      assert_match(/\bchd=e:\.\.\.\.\.-ABAAAA\b/, @chart.to_url)
    end
    
    should 'encode floating point data' do
      @chart.data = [2281.49, 3232.50]
      @chart.scale = 0..4095
      assert_match(/\bchd=e:jpyh\b/, @chart.to_url)
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
    
    should 'encode missing data' do
      @chart.data = [6, nil, 14]
      @chart.scale = 0..100
      assert_match(/\bchd=t:6,-1,14\b/, @chart.to_url)
    end
    
    should 'encode out-of-bounds data' do
      @chart.data = [101, 100, 99, 1, 0, -1]
      @chart.scale = 0..100
      assert_match(/\bchd=t:100,100,99,1,0,0\b/, @chart.to_url)
    end
    
    should 'rounds floating point data to the nearest tenth' do
      @chart.data = [5.95, 14.01, 5.23]
      @chart.scale = 0..100
      assert_match(/\bchd=t:6,14,5.2\b/, @chart.to_url)
    end
  end
end
