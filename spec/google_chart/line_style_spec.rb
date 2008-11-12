require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::LineStyle do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::LineStyle }
  end
  
  it 'does not generate line style parameters by default' do
    @klass.new.to_url.should_not =~ /\bchls=\b/
  end
  
  it 'has a solid line style' do
    @klass.new(:style => :solid).to_url.should =~ /\bchls=1,1,0\b/
  end
  
  it 'has a dashed line style' do
    @klass.new(:style => :dash).to_url.should =~ /\bchls=1,3,2\b/
  end
  
  it 'has a dotted line style' do
    @klass.new(:style => :dot).to_url.should =~ /\bchls=1,1,2\b/
  end
  
  it 'can have multiple line styles' do
    @klass.new(:style => [:solid, :dash, :dot]).to_url.should =~ /\bchls=1,1,0\|1,3,2\|1,1,2\b/
  end
  
  describe 'with a custom line width' do
    it 'has a solid line style' do
      @klass.new(:style => :solid, :width => 2).to_url.should =~ /\bchls=2,2,0\b/
    end
    
    it 'has a dashed line style' do
      @klass.new(:style => :dash, :width => 2).to_url.should =~ /\bchls=2,6,4\b/
    end
    
    it 'has a dotted line style' do
      @klass.new(:style => :dot, :width => 2).to_url.should =~ /\bchls=2,2,4\b/
    end
    
    it 'can have multiple line widths' do
      @klass.new(:style => [:solid, :dash], :width => [1,2]).to_url.should =~ /\bchls=1,1,0\|2,6,4\b/
    end
    
    it 'uses default width if there are more styles than widths' do
      @klass.new(:style => [:solid, :dash], :width => 2).to_url.should =~ /\bchls=2,2,0\|1,3,2\b/
    end
    
    it 'uses default line style if there are more widths than styles' do
      @klass.new(:style => :dash, :width => [2, 2]).to_url.should =~ /\bchls=2,6,4\|2,2,0\b/
    end
  end
end
