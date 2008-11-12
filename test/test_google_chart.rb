require File.dirname(__FILE__) + '/test_helper.rb'

class TestGoogleChart < Test::Unit::TestCase
  context '#Line' do
    context 'with hash parameters' do
      setup do
        @url = GoogleChart.Line(:size => '1000x300', :data => [[35, 41], [50, 33]], :scale => 0..61)
      end
      
      should 'return Google Chart URL' do
        assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, @url)
      end
      
      should 'include chart type parameter' do
        assert_match(/\bcht=lc\b/, @url)
      end
      
      should 'include chart size parameter' do
        assert_match(/\bchs=1000x300\b/, @url)
      end
      
      should 'include chart data parameter' do
        assert_match(/\bchd=s:jp,yh\b/, @url)
      end
    end
    
    context 'with block parameters' do
      setup do
        @url = GoogleChart.Line do |c|
          c.size = '800x375'
          c.data = [[35, 41], [50, 33]]
          c.scale = 0..61
        end
      end
      
      should 'return Google Chart URL' do
        assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, @url)
      end
      
      should 'include chart type parameter' do
        assert_match(/\bcht=lc\b/, @url)
      end
      
      should 'include chart size parameter' do
        assert_match(/\bchs=800x375\b/, @url)
      end
      
      should 'include chart data parameter' do
        assert_match(/\bchd=s:jp,yh\b/, @url)
      end
    end
  end
  
  context '#Bar' do
    context 'with hash parameters' do
      setup do
        @url = GoogleChart.Bar(:size => '1000x300', :data => [[35, 41], [50, 33]], :scale => 0..61)
      end
      
      should 'return Google Chart URL' do
        assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, @url)
      end
      
      should 'include chart type parameter' do
        assert_match(/\bcht=bvs\b/, @url)
      end
      
      should 'include chart size parameter' do
        assert_match(/\bchs=1000x300\b/, @url)
      end
      
      should 'include chart data parameter' do
        assert_match(/\bchd=s:jp,yh\b/, @url)
      end
    end
    
    context 'with block parameters' do
      setup do
        @url = GoogleChart.Bar do |c|
          c.size = '800x375'
          c.data = [[35, 41], [50, 33]]
          c.scale = 0..61
        end
      end
      
      should 'return Google Chart URL' do
        assert_match(%r{\Ahttp://chart\.apis\.google\.com/chart\?}, @url)
      end
      
      should 'include chart type parameter' do
        assert_match(/\bcht=bvs\b/, @url)
      end
      
      should 'include chart size parameter' do
        assert_match(/\bchs=800x375\b/, @url)
      end
      
      should 'include chart data parameter' do
        assert_match(/\bchd=s:jp,yh\b/, @url)
      end
    end
  end
end
