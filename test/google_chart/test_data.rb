require File.dirname(__FILE__) + '/../test_helper'

class TestData < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Data }
  end
  
  should 'use simple encoding by default' do
    assert_match(/\bchd=s:AB89\b/, @klass.new(:data => [0,1,60,61]).to_url)
  end
  
  context 'simple encoding' do
    should 'encode single dataset' do
      assert_match(/\bchd=s:Af9\b/, @klass.new(:data => [0, 31, 61], :encoding => :simple).to_url)
    end
    
    should 'encode multiple datasets' do
      assert_match(/\bchd=s:JP,YH\b/, @klass.new(:data => [[9, 15], [24, 7]], :encoding => :simple).to_url)
    end
    
    should 'encode missing data' do
      assert_match(/\bchd=s:y_h\b/, @klass.new(:data => [50, nil, 33], :encoding => :simple).to_url)
    end
    
    should 'encode floating point data' do
      assert_match(/\bchd=s:yh\b/, @klass.new(:data => [49.5, 33.4], :encoding => :simple).to_url)
    end
    
    should 'scale data based on maximum value by default'
    
    should 'scale data using custom scale'
  end
  
  context 'extended encoding' do
    should 'encode single dataset' do
      assert_match(/\bchd=e:AA\.\.gA\b/, @klass.new(:data => [0, 4095, 2048], :encoding => :extended).to_url)
    end
    
    should 'encode multiple datasets' do
      assert_match(/\bchd=e:jpyh,JPYH\b/, @klass.new(:data => [[2281, 3233], [591, 1543]], :encoding => :extended).to_url)
    end
    
    should 'encode missing data' do
      assert_match(/\bchd=e:jp__yh\b/, @klass.new(:data => [2281, nil, 3233], :encoding => :extended).to_url)
    end
    
    should 'encode floating point data' do
      assert_match(/\bchd=e:jpyh\b/, @klass.new(:data => [2281.4, 3232.5], :encoding => :extended).to_url)
    end
    
    should 'scale data based on maximum value by default'
    
    should 'scale data using custom scale'
  end
  
  context 'text encoding' do
    should 'encode single dataset' do
      assert_match(/\bchd=t:6,14,5.2\b/, @klass.new(:data => [6, 14, 5.23], :encoding => :text).to_url)
    end
    
    should 'encode multiple datasets' do
      assert_match(/\bchd=t:6,14\|5,23\b/, @klass.new(:data => [[6, 14], [5, 23]], :encoding => :text).to_url)
    end
    
    should 'encode missing data' do
      assert_match(/\bchd=t:6,-1,14\b/, @klass.new(:data => [6, nil, 14], :encoding => :text).to_url)
    end
    
    should 'round floating point data to nearest 10th' do
      assert_match(/\bchd=t:6.1,8.2\b/, @klass.new(:data => [6.14, 8.16], :encoding => :text).to_url)
    end
    
    should 'round floating point data to nearest integer when possible' do
      assert_match(/\bchd=t:6,14\b/, @klass.new(:data => [5.95, 14.04], :encoding => :text).to_url)
    end
    
    should 'scale data based on maximum value by default'
    
    should 'scale data using custom scale'
  end
end
