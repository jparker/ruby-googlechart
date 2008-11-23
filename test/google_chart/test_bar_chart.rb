require File.dirname(__FILE__) + '/../test_helper'

class TestBarChart < Test::Unit::TestCase
  should 'have a default chart type' do
    assert_match(/\bcht=bvg\b/, GoogleChart::BarChart.new.to_url)
  end
  
  should 'support horizontal orientation' do
    assert_match(/\bcht=bhg\b/, GoogleChart::BarChart.new(:horizontal => true).to_url)
  end
  
  should 'support grouping' do
    assert_match(/\bcht=bvg\b/, GoogleChart::BarChart.new(:grouping => :group).to_url)
  end
  
  should 'support stacking' do
    assert_match(/\bcht=bvs\b/, GoogleChart::BarChart.new(:grouping => :stack).to_url)
  end
  
  should 'support overlapping as alias for stacking' do
    assert_match(/\bcht=bvs\b/, GoogleChart::BarChart.new(:grouping => :overlap).to_url)
  end
  
  should 'support horizontal orientation with grouping' do
    assert_match(/\bcht=bhg\b/, GoogleChart::BarChart.new(:horizontal => true, :grouping => :group).to_url)
  end
  
  should 'support horizontal orientation with stacking' do
    assert_match(/\bcht=bhs\b/, GoogleChart::BarChart.new(:horizontal => true, :grouping => :stack).to_url)
  end
  
  should 'support horizontal orientation with overlapping' do
    assert_match(/\bcht=bhs\b/, GoogleChart::BarChart.new(:horizontal => true, :grouping => :overlap).to_url)
  end
  
  context 'data reduction and scaling' do
    context 'with one data set' do
      setup { @chart = GoogleChart::BarChart.new(:data => [0,2,3]) }
      
      should 'scale normally for grouping' do
        @chart.grouping = :group
        assert_match(/\bchd=s:Ao9\b/, @chart.to_url)
      end
      
      should 'scale normally for stacking' do
        @chart.grouping = :stack
        assert_match(/\bchd=s:Ao9\b/, @chart.to_url)
      end
      
      should 'scale normally for overlapping' do
        @chart.grouping = :overlap
        assert_match(/\bchd=s:Ao9\b/, @chart.to_url)
      end
    end
    
    context 'with two data sets' do
      setup { @chart = GoogleChart::BarChart.new(:data => [[0,2,3], [0,4,6]]) }
      
      should 'scale normally for grouping' do
        @chart.grouping = :group
        assert_match(/\bchd=s:AUe,Ao9\b/, @chart.to_url)
      end
      
      should 'scale based on column sums for stacking' do
        @chart.grouping = :stack
        assert_match(/\bchd=s:ANU,Abo\b/, @chart.to_url)
      end
      
      should 'scale based on reduced data for overlapping' do
        @chart.grouping = :overlap
        assert_match(/\bchd=s:AUe,AUe\b/, @chart.to_url)
      end
    end
    
    context 'with three data sets' do
      setup { @chart = GoogleChart::BarChart.new(:data => [[0,2,3], [0,4,6], [0,6,9]]) }
      
      should 'scale normally for grouping' do
        @chart.grouping = :group
        assert_match(/\bchd=s:ANU,Abo,Ao9\b/, @chart.to_url)
      end
      
      should 'scale based on column sums for stacking' do
        @chart.grouping = :stack
        assert_match(/\bchd=s:AGK,ANU,AUe\b/, @chart.to_url)
      end
      
      should 'scale based on reduced data for overlapping' do
        @chart.grouping = :overlap
        assert_match(/\bchd=s:ANU,ANU,AAA\b/, @chart.to_url)
      end
    end
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
