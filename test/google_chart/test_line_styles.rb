require File.dirname(__FILE__) + '/../test_helper'

TestChart.class_eval do
  include GoogleChart::LineStyles
end

class TestGoogleChartLineStyles < Test::Unit::TestCase
  def test_should_not_have_line_styles_by_default
    assert_no_match(/\bchls=/, TestChart.new.to_url)
  end
  
  def test_should_accept_solid_as_a_line_style
    assert_match(/\bchls=1,1,0\b/, TestChart.new(:style => :solid).to_url)
  end
  
  def test_should_accept_dash_as_a_line_style
    assert_match(/\bchls=1,3,2\b/, TestChart.new(:style => :dash).to_url)
  end
  
  def test_should_accept_dot_as_a_line_style
    assert_match(/\bchls=1,1,2\b/, TestChart.new(:style => :dot).to_url)
  end
  
  def test_should_accept_multiple_line_styles
    assert_match(/\bchls=1,1,0\|1,3,2\b/, TestChart.new(:style => [:solid, :dash]).to_url)
  end
  
  def test_should_accept_a_single_line_width
    assert_match(/\bchls=2,2,0\b/, TestChart.new(:width => 2).to_url)
  end
  
  def test_should_accept_multiple_line_widths
    assert_match(/\bchls=3,3,0\|2,6,4\b/, TestChart.new(:style => [:solid, :dash], :width => [3, 2]).to_url)
  end
end
