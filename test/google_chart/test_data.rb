require File.dirname(__FILE__) + '/../test_helper'

TestChart.class_eval do
  include GoogleChart::Data
end

class TestGoogleChartData < Test::Unit::TestCase
  def test_should_use_simple_encoding_by_default
    assert_match /\bchd=s:A9\b/, TestChart.new(:data => [0,61]).to_url
  end
  
  def test_should_be_able_to_use_simple_encoding_on_multiple_datasets
    assert_match /\bchd=s:jp,yh\b/, TestChart.new(:data => [[35,41], [50,33]]).to_url
  end
  
  def test_should_correctly_encode_missing_data_using_simple_encoding
    assert_match /\bchd=s:j_y\b/, TestChart.new(:data => [35,nil,50]).to_url
  end
  
  def test_should_be_able_to_use_extended_encoding
    assert_match /\bchd=e:AA\.\./, TestChart.new(:data => [0,4095], :encoding => :extended).to_url
  end
  
  def test_should_be_able_to_use_extended_encoding_on_multiple_datasets
    assert_match /\bchd=e:jpyh,JPYH\b/, TestChart.new(:data => [[2281,3233], [591,1543]], :encoding => :extended).to_url
  end
  
  def test_should_correctly_encode_missing_data_using_extended_encoding
    assert_match /\bchd=e:jp__yh\b/, TestChart.new(:data =>[2281,nil,3233], :encoding => :extended).to_url
  end
end
