require File.dirname(__FILE__) + '/../test_helper'

class TestBarChart < Test::Unit::TestCase
  should 'have a default chart type' do
    assert_match(/\bcht=bvs\b/, GoogleChart::BarChart.new.to_url)
  end
  
  should 'support horizontal orientation' do
    assert_match(/\bcht=bhs\b/, GoogleChart::BarChart.new(:horizontal => true).to_url)
  end
  
  should 'support grouped grouping' do
    assert_match(/\bcht=bvg\b/, GoogleChart::BarChart.new(:grouped => true).to_url)
  end
  
  should 'support horizontal orientation and grouped grouping' do
    assert_match(/\bcht=bhg\b/, GoogleChart::BarChart.new(:horizontal => true, :grouped => true).to_url)
  end
  
  should 'include Axis module' do
    assert GoogleChart::Axis === GoogleChart::BarChart.new
  end
  
  should 'include BarStyle module' do
    assert GoogleChart::BarStyle === GoogleChart::BarChart.new
  end
  
  should 'include Color module' do
    assert GoogleChart::Color === GoogleChart::BarChart.new
  end
  
  should 'include Data module' do
    assert GoogleChart::Data === GoogleChart::BarChart.new
  end
  
  should 'include GridLine module' do
    assert GoogleChart::GridLine === GoogleChart::BarChart.new
  end
  
  should 'include Legend module' do
    assert GoogleChart::Legend === GoogleChart::BarChart.new
  end
  
  should 'include RangeMarker module' do
    assert GoogleChart::RangeMarker === GoogleChart::BarChart.new
  end
  
  should 'include Title module' do
    assert GoogleChart::Title === GoogleChart::BarChart.new
  end
end
