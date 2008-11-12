require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::Color do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Color }
  end
  
  it 'does not generate a color parameter if no colors were provided' do
    @klass.new.to_url.should_not =~ /\bchco=/
  end
  
  it 'generates a color parameter with the given color' do
    @klass.new(:color => 'ff0000').to_url.should =~ /\bchco=ff0000\b/
  end
  
  it 'generates a color parameter with a comma-separate list of the given colors' do
    @klass.new(:color => %w[ff0000 00ff00 0000ff]).to_url.should =~ /\bchco=ff0000,00ff00,0000ff\b/
  end
end
