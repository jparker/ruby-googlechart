require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::Bar do
  it 'has a default chart type' do
    GoogleChart::Bar.new.type.should == 'cht=bvg'
  end
  
  it 'can have horizontal orientation' do
    GoogleChart::Bar.new(:horizontal => true).type.should == 'cht=bhg'
  end
  
  it 'can be stacked' do
    GoogleChart::Bar.new(:stacked => true).type.should == 'cht=bvs'
  end
  
  it 'can be horizontal and stacked' do
    GoogleChart::Bar.new(:horizontal => true, :stacked => true).type.should == 'cht=bhs'
  end
  
  it 'includes the axis module' do
    GoogleChart::Bar.should include(GoogleChart::Axis)
  end
  
  it 'includes the bar_style module' do
    GoogleChart::Bar.should include(GoogleChart::BarStyle)
  end
  
  it 'includes the color module' do
    GoogleChart::Bar.should include(GoogleChart::Color)
  end
  
  it 'includes the data module' do
    GoogleChart::Bar.should include(GoogleChart::Data)
  end
  
  it 'includes the grid_line module' do
    GoogleChart::Bar.should include(GoogleChart::GridLine)
  end
  
  it 'includes the legend module' do
    GoogleChart::Bar.should include(GoogleChart::Legend)
  end
  
  it 'includes the range_marker module' do
    GoogleChart::Bar.should include(GoogleChart::RangeMarker)
  end
  
  it 'includes the title module' do
    GoogleChart::Bar.should include(GoogleChart::Title)
  end
end
