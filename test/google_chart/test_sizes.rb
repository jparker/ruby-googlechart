require File.dirname(__FILE__) + '/../test_helper'

TestChart.class_eval do
  include GoogleChart::Sizes
end

class TestGoogleChartSizes < Test::Unit::TestCase
  def test_should_have_default_size
    assert_match /\bchs=600x500\b/, TestChart.new.to_url
  end
  
  def test_should_accept_custom_size
    assert_match /\bchs=800x375\b/, TestChart.new(:size => '800x375').to_url
  end
end
