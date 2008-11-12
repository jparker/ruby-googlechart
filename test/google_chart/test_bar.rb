require File.dirname(__FILE__) + '/../test_helper'

class TestBar < Test::Unit::TestCase
  should 'have a default chart type' do
    assert_match(/\bcht=bvs\b/, GoogleChart::Bar.new.to_url)
  end
  
  should 'support horizontal orientation' do
    assert_match(/\bcht=bhs\b/, GoogleChart::Bar.new(:horizontal => true).to_url)
  end
  
  should 'support grouped grouping' do
    assert_match(/\bcht=bvg\b/, GoogleChart::Bar.new(:grouped => true).to_url)
  end
  
  should 'support horizontal orientation and grouped grouping' do
    assert_match(/\bcht=bhg\b/, GoogleChart::Bar.new(:horizontal => true, :grouped => true).to_url)
  end
  
  should 'include Axes module' do
    assert GoogleChart::Axes === GoogleChart::Bar.new
  end
  
  should 'include BarStyles module' do
    assert GoogleChart::BarStyles === GoogleChart::Bar.new
  end
  
  should 'include Colors module' do
    assert GoogleChart::Colors === GoogleChart::Bar.new
  end
  
  should 'include Data module' do
    assert GoogleChart::Data === GoogleChart::Bar.new
  end
  
  should 'include GridLines module' do
    assert GoogleChart::GridLines === GoogleChart::Bar.new
  end
  
  should 'include Legends module' do
    assert GoogleChart::Legends === GoogleChart::Bar.new
  end
  
  should 'include RangeMarkers module' do
    assert GoogleChart::RangeMarkers === GoogleChart::Bar.new
  end
  
  should 'include Sizes module' do
    assert GoogleChart::Sizes === GoogleChart::Bar.new
  end
  
  should 'include Titles module' do
    assert GoogleChart::Titles === GoogleChart::Bar.new
  end
end
