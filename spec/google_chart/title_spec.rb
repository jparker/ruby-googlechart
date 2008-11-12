require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::Title do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Title }
  end
  
  it 'does not include a title parameter if no title was provided' do
    @klass.new.to_url.should_not =~ /\bchtt=/
  end
  
  it 'includes an escaped title parameter when a title is provided' do
    @klass.new(:title => 'foo bar').to_url.should =~ /\bchtt=foo\+bar\b/
  end
end
