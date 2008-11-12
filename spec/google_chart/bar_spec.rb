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
  
  it 'includes the data module' do
    GoogleChart::Bar.should include(GoogleChart::Data)
  end
  
  it 'includes the color module' do
    GoogleChart::Bar.should include(GoogleChart::Color)
  end
  
  it 'includes the title module' do
    GoogleChart::Bar.should include(GoogleChart::Title)
  end
end
