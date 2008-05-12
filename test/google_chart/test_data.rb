require File.dirname(__FILE__) + '/../test_helper'

FooChart.class_eval { include GoogleChart::Data }

class TestData < Test::Unit::TestCase
  def test_should_use_simple_encoding_by_default
    assert_equal('chd=s:AB89', FooChart.new(:data => [0,1,60,61]).data)
  end
  
  def test_should_be_able_to_use_simple_encoding_on_multiple_data_sets
    assert_equal('chd=s:JP,YH', FooChart.new(:data => [[9,15], [24,7]]).data)
  end
  
  def test_should_correctly_encode_missing_data_using_simple_encoding
    assert_equal('chd=s:y_h', FooChart.new(:data => [50,nil,33]).data)
  end
  
  def test_should_be_able_to_use_extended_encoding
    assert_equal('chd=e:jpyh,JPYH', FooChart.new(:data => [[2281,3233], [591,1543]], :encoding => :extended).data)
  end
  
  def test_should_correnctly_encode_missing_data_using_extended_encoding
    assert_equal('chd=e:jp__yh', FooChart.new(:data => [2281,nil,3233], :encoding => :extended).data)
  end
end
