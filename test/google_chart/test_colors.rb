require File.dirname(__FILE__) + '/../test_helper'

TestChart.class_eval do
  include GoogleChart::Colors
end

class TestGoogleChartColors < Test::Unit::TestCase
  def test_should_not_have_any_colors_by_default
    assert_no_match(/\bchco=/, TestChart.new.to_url)
  end
  
  def test_should_be_able_to_specify_a_color
    assert_match(/\bchco=ff0000\b/, TestChart.new(:color => 'ff0000').to_url)
  end
  
  def test_should_be_able_to_specify_multiple_colors
    assert_match(/\bchco=ff0000,0000ff\b/, TestChart.new(:color => %w[ff0000 0000ff]).to_url)
  end
  
  def test_should_be_able_to_specify_color_by_name
    assert_match(/\bchco=ff0000\b/, TestChart.new(:color => :red).to_url)
  end
  
  def test_should_be_able_to_mix_color_names_and_color_codes
    assert_match(/\bchco=ff0000,0000ff\b/, TestChart.new(:color => ['ff0000', :blue]).to_url)
  end
end
