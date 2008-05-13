require File.dirname(__FILE__) + '/../test_helper'

class TestData < Test::Unit::TestCase
  def setup
    @klass = Class.new(TestChart).class_eval { include GoogleChart::Data }
  end
  
  def test_should_add_data_to_parameter_registry
    assert @klass.registry.include?(:data)
  end
  
  def test_should_use_simple_encoding_by_default
    assert_equal('chd=s:AB89', @klass.new(:data => [0,1,60,61]).data)
  end
  
  def test_should_be_able_to_scale_over_wide_data_sets_to_fit_within_simple_encoding_range
    assert_equal('chd=s:Af9', @klass.new(:data => [-100, 0, 100], :scale => true).data)
  end
  
  def test_should_be_able_to_use_simple_encoding_on_multiple_data_sets
    assert_equal('chd=s:JP,YH', @klass.new(:data => [[9,15], [24,7]]).data)
  end
  
  def test_should_correctly_encode_missing_data_using_simple_encoding
    assert_equal('chd=s:y_h', @klass.new(:data => [50,nil,33]).data)
  end
  
  def test_should_correctly_encode_floating_point_data_using_simple_encoding
    assert_equal('chd=s:yh', @klass.new(:data => [50.49, 32.51]).data)
  end
  
  def test_should_be_able_to_use_extended_encoding
    assert_equal('chd=e:jpyh,JPYH', @klass.new(:data => [[2281,3233], [591,1543]], :encoding => :extended).data)
  end
  
  def test_should_be_able_to_scale_over_wide_data_sets_to_fit_within_extended_encoding_range
    assert_equal('chd=e:AAgA..', @klass.new(:data => [-5000, 0, 5000], :encoding => :extended, :scale => true).data)
  end
  
  def test_should_correctly_encode_missing_data_using_extended_encoding
    assert_equal('chd=e:jp__yh', @klass.new(:data => [2281,nil,3233], :encoding => :extended).data)
  end
  
  def test_should_correctly_encode_floating_point_data_using_extended_encoding
    assert_equal('chd=e:jpyh', @klass.new(:data => [2281.49, 3232.51], :encoding => :extended).data)
  end
  
  def test_should_be_able_to_use_text_encoding
    assert_equal('chd=t:6,14,19.5', @klass.new(:data => [6, 14, 19.5], :encoding => :text).data)
  end
  
  def test_should_be_able_to_scale_over_wide_data_sets_to_fit_within_text_encoding_range
    assert_equal('chd=t:0,50,100', @klass.new(:data => [-200, 0, 200], :encoding => :text, :scale => true).data)
  end
  
  def test_should_correctly_encode_missing_data_using_text_encoding
    assert_equal('chd=t:6,-1,14', @klass.new(:data => [6, nil, 14], :encoding => :text).data)
  end
  
  def test_should_round_floating_point_data_to_one_decimal_place_using_text_encoding
    assert_equal('chd=t:6.1,8.2', @klass.new(:data => [6.14, 8.16], :encoding => :text).data)
  end
  
  def test_should_round_floating_point_data_to_integer_data_when_possible_using_text_encoding
    assert_equal('chd=t:6,14', @klass.new(:data => [5.95, 14.01], :encoding => :text).data)
  end
end
