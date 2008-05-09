require File.dirname(__FILE__) + '/../test_helper'

TestChart.class_eval do
  include GoogleChart::Axes
end

class TestGoogleChartAxes < Test::Unit::TestCase
  def test_should_be_able_to_display_bottom_x_axis
    assert_match(/\bchxt=x\b/, TestChart.new(:axes => {:x => true}).to_url)
  end
  
  def test_should_be_able_to_display_left_y_axis
    assert_match(/\bchxt=y\b/, TestChart.new(:axes => {:y => true}).to_url)
  end
  
  def test_should_be_able_to_display_right_y_axis
    assert_match(/\bchxt=r\b/, TestChart.new(:axes => {:r => true}).to_url)
  end
  
  def test_should_be_able_to_display_top_x_axis
    assert_match(/\bchxt=t\b/, TestChart.new(:axes => {:t => true}).to_url)
  end
  
  def test_should_be_able_to_display_multiple_axes
    assert_match(/\bchxt=x,y,r\b/, TestChart.new(:axes => {:x => true, :y => true, :r => true}).to_url)
  end
  
  def test_should_not_display_axes_by_default
    assert_no_match(/\bchxt=/, TestChart.new.to_url)
  end
  
  def test_should_not_display_axis_labels_by_default
    assert_no_match(/\bchxl=/, TestChart.new(:axes => {:x => true}).to_url)
  end
  
  def test_should_not_display_axis_ranges_by_default
    assert_no_match(/\bchxr=/, TestChart.new(:axes => {:x => true}).to_url)
  end
  
  def test_should_be_able_to_display_arrays_as_axis_labels
    url = TestChart.new(:axes => {:x => %w[foo bar]}).to_url
    assert_match(/\bchxt=x\b/, url)
    assert_match(/\bchxl=0:\|foo\|bar\b/, url)
  end
  
  def test_should_be_able_to_display_multiple_arrays_as_axis_labels
    url = TestChart.new(:axes => {:x => %w[foo bar], :y => %w[baz froz]}).to_url
    assert_match(/\bchxt=x,y\b/, url)
    assert_match(/\bchxl=0:\|foo\|bar\|1:\|baz\|froz\b/, url)
  end
  
  def test_should_be_able_to_display_ranges_as_axis_labels
    url = TestChart.new(:axes => {:x => 1..10}).to_url
    assert_match(/\bchxt=x\b/, url)
    assert_match(/\bchxr=0,1,10\b/, url)
  end
  
  def test_should_be_able_to_display_multiple_ranges_as_axis_labels
    url = TestChart.new(:axes => {:x => 1..10, :y => 0..100}).to_url
    assert_match(/\bchxt=x,y\b/, url)
    assert_match(/\bchxr=0,1,10\|1,0,100\b/, url)
  end
  
  def test_should_be_able_to_display_mixed_axis_labels
    url = TestChart.new(:axes => {:x => %w[foo bar], :y => true, :r => 0..25}).to_url
    assert_match(/\bchxt=x,y,r\b/, url)
    assert_match(/\bchxl=0:\|foo\|bar\b/, url)
    assert_match(/\bchxr=2,0,25\b/, url)
  end
end
