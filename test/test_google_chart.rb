require File.dirname(__FILE__) + '/test_helper.rb'

class TestGoogleChartLineMethod < Test::Unit::TestCase
  def setup
    @url = GoogleChart.Line(
      :size => '800x375',
      :data => [[35, 41], [50, 33]],
      :color => %w[ff0000 ffcccc],
      :style => [:solid, :dot],
      :width => 2,
      :title => 'Meep Meep'
    )
  end
  
  def test_should_have_google_url
    assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, @url)
  end
  
  def test_should_have_correct_chart_type
    assert_match(/\bcht=lc\b/, @url)
  end
  
  def test_should_have_correct_size
    assert_match(/\bchs=800x375\b/, @url)
  end
  
  def test_should_have_correct_data
    assert_match(/\bchd=s:jp,yh\b/, @url)
  end
  
  def test_should_have_correct_colors
    assert_match(/\bchco=ff0000,ffcccc\b/, @url)
  end
  
  def test_should_have_correct_line_styles
    assert_match(/\bchls=2,2,0\|1,1,2\b/, @url)
  end
  
  def test_should_have_correct_title
    assert_match(/\bchtt=Meep\+Meep\b/, @url)
  end
end
