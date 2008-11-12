require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::BarStyle do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::BarStyle }
  end
  
  it 'does not generate bar style parameters by default' do
    @klass.new.to_url.should_not =~ /\bchbh=/
  end
  
  it 'accepts bar width' do
    @klass.new(:width => 10).to_url.should =~ /\bchbh=10\b/
  end
  
  it 'accepts bar spacing' do
    @klass.new(:spacing => 5, :width => 10).to_url.should =~ /\bchbh=10,5\b/
  end
  
  it 'accepts bar and group spacing' do
    @klass.new(:spacing => [4,12], :width => 8).to_url.should =~ /\bchbh=8,4,12\b/
  end
end
