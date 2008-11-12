require File.dirname(__FILE__) + '/../test_helper'

class TestLine < Test::Unit::TestCase
  should 'have a default chart type' do
    assert_match(/\bcht=lc\b/, GoogleChart::Line.new.to_url)
  end
  
  should 'support xy chart type' do
    assert_match(/\bcht=lxy\b/, GoogleChart::Line.new(:type => :xy).to_url)
  end
  
  should 'support sparkline chart type' do
    assert_match(/\bcht=ls\b/, GoogleChart::Line.new(:type => :sparkline).to_url)
  end
  
  should 'support line as chart type' do
    assert_match(/\bcht=lc\b/, GoogleChart::Line.new(:type => :line).to_url)
  end
  
  should 'include Axes module' do
    assert GoogleChart::Axes === GoogleChart::Line.new
  end
  
  should 'include Colors module' do
    assert GoogleChart::Colors === GoogleChart::Line.new
  end
  
  should 'include Data module' do
    assert GoogleChart::Data === GoogleChart::Line.new
  end
  
  should 'include GridLines module' do
    assert GoogleChart::GridLines === GoogleChart::Line.new
  end
  
  should 'include Legends module' do
    assert GoogleChart::Legends === GoogleChart::Line.new
  end
  
  should 'include LineStyles module' do
    assert GoogleChart::LineStyles === GoogleChart::Line.new
  end
  
  should 'include RangeMarkers module' do
    assert GoogleChart::RangeMarkers === GoogleChart::Line.new
  end
  
  should 'include Sizes module' do
    assert GoogleChart::Sizes === GoogleChart::Line.new
  end
  
  should 'include Titles module' do
    assert GoogleChart::Titles === GoogleChart::Line.new
  end
end
