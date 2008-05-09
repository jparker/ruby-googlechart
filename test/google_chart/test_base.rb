require File.dirname(__FILE__) + '/../test_helper'

class TestGoogleChartBase < Test::Unit::TestCase
  def test_should_start_with_google_chart_base_url
    assert_match %r{\Ahttp://chart\.apis\.google\.com/chart\?}, TestChart.new.to_url
  end
  
  def test_should_include_colors_module
    assert GoogleChart::Base.include?(GoogleChart::Colors)
  end
  
  def test_should_include_data_module
    assert GoogleChart::Base.include?(GoogleChart::Data)
  end
  
  def test_should_include_sizes_module
    assert GoogleChart::Base.include?(GoogleChart::Sizes)
  end
  
  def test_should_include_titles_module
    assert GoogleChart::Base.include?(GoogleChart::Titles)
  end
end
