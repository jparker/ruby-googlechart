require File.dirname(__FILE__) + '/../test_helper'

TestChart.class_eval do
  include GoogleChart::Titles
end

class TestGoogleChartTitles < Test::Unit::TestCase
  def test_should_not_have_default_title
    assert_no_match(/\bchtt=/, TestChart.new.to_url)
  end
  
  def test_should_be_able_to_encode_and_display_title
    assert_match(/\bchtt=foo\+bar\b/, TestChart.new(:title => 'foo bar').to_url)
  end
end
