require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::Line do
  it 'has a default chart type' do
    GoogleChart::Line.new.type.should == 'cht=lc'
  end
  
  it 'accepts :line as a chart type' do
    GoogleChart::Line.new(:type => :line).type.should == 'cht=lc'
  end
  
  it 'accepts :xy as a chart type' do
    GoogleChart::Line.new(:type => :xy).type.should == 'cht=lxy'
  end
  
  it 'accepts :spark as a chart type' do
    GoogleChart::Line.new(:type => :spark).type.should == 'cht=ls'
  end
  
  it 'includes the axis module' do
    GoogleChart::Line.should include(GoogleChart::Axis)
  end
  
  it 'includes the color module' do
    GoogleChart::Line.should include(GoogleChart::Color)
  end
  
  it 'includes the data module' do
    GoogleChart::Line.should include(GoogleChart::Data)
  end
  
  it 'includes the grid_line module' do
    GoogleChart::Line.should include(GoogleChart::GridLine)
  end
  
  it 'includes the legend module' do
    GoogleChart::Line.should include(GoogleChart::Legend)
  end
  
  it 'includes the line style module' do
    GoogleChart::Line.should include(GoogleChart::LineStyle)
  end
  
  it 'includes the range_marker module' do
    GoogleChart::Line.should include(GoogleChart::RangeMarker)
  end
  
  it 'includes the title module' do
    GoogleChart::Line.should include(GoogleChart::Title)
  end
end
