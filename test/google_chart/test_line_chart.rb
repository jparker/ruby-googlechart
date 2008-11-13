require File.dirname(__FILE__) + '/../test_helper'

class TestLineChart < Test::Unit::TestCase
  should 'have a default chart type' do
    assert_match(/\bcht=lc\b/, GoogleChart::LineChart.new.to_url)
  end
  
  should 'support xy chart type' do
    assert_match(/\bcht=lxy\b/, GoogleChart::LineChart.new(:type => :xy).to_url)
  end
  
  should 'support sparkline chart type' do
    assert_match(/\bcht=ls\b/, GoogleChart::LineChart.new(:type => :sparkline).to_url)
  end
  
  should 'support line as chart type' do
    assert_match(/\bcht=lc\b/, GoogleChart::LineChart.new(:type => :line).to_url)
  end
  
  should 'include Axis module' do
    assert GoogleChart::Axis === GoogleChart::LineChart.new
  end
  
  should 'include Color module' do
    assert GoogleChart::Color === GoogleChart::LineChart.new
  end
  
  should 'include Data module' do
    assert GoogleChart::Data === GoogleChart::LineChart.new
  end
  
  should 'include GridLine module' do
    assert GoogleChart::GridLine === GoogleChart::LineChart.new
  end
  
  should 'include Legend module' do
    assert GoogleChart::Legend === GoogleChart::LineChart.new
  end
  
  should 'include LineStyle module' do
    assert GoogleChart::LineStyle === GoogleChart::LineChart.new
  end
  
  should 'include RangeMarker module' do
    assert GoogleChart::RangeMarker === GoogleChart::LineChart.new
  end
  
  should 'include Title module' do
    assert GoogleChart::Title === GoogleChart::LineChart.new
  end
end
