require File.dirname(__FILE__) + '/../test_helper'

class TestColor < Test::Unit::TestCase
  def setup
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Color }
  end
  
  should 'not display color parameter by default' do
    assert_no_match(/\bchco=/, @klass.new.to_url)
  end
  
  should 'display single color parameter' do
    assert_match(/\bchco=ff0000\b/, @klass.new(:color => 'ff0000').to_url)
  end
  
  should 'display multiple color parameters' do
    assert_match(/\bchco=ff0000,00ff00,0000ff\b/, @klass.new(:color => %w[ff0000 00ff00 0000ff]).to_url)
  end
  
  should 'convert 3-digit colors to 6-digit colors'
end
