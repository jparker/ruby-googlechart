require File.dirname(__FILE__) + '/spec_helper.rb'

describe GoogleChart do
  describe '#Line' do
    describe 'with hash parameters' do
      before do
        @url = GoogleChart.Line(:data => [523, 816, 614])
      end
      
      it 'begins with Google Charts base URL' do
        @url.should =~ %r{\Ahttp://chart.apis.google.com/chart\?}
      end
      
      it 'has a default chart size' do
        @url.should =~ /\bchs=400x300\b/
      end
      
      it 'has a default chart type' do
        @url.should =~ /\bcht=lc\b/
      end
      
      it 'has simple-encoded data' do
        @url.should =~ /\bchd=s:A9T\b/
      end
    end
    
    describe 'with block parameters' do
      before do
        @url = GoogleChart.Line do |c|
          c.type = :spark
          c.size = '800x375'
          c.data = [[5,10,15], [15,10,5], [10,5,14]]
          c.encoding = :extended
          c.scale = 0..20
          c.color = %w[ff0000 00ff00 0000ff]
          c.style = [:solid, :dash, :dot]
          c.width = [1,2,3]
        end
      end
      
      it 'has the given chart type' do
        @url.should =~ /\bcht=ls\b/
      end
      
      it 'has the given chart size' do
        @url.should =~ /\bchs=800x375\b/
      end
      
      it 'uses the given colors' do
        @url.should =~ /\bchco=ff0000,00ff00,0000ff\b/
      end
      
      it 'uses the given line styles' do
        @url.should =~ /\bchls=1,1,0\|2,6,4\|3,3,6\b/
      end
      
      it 'has the encoded data' do
        @url.should =~ /\b chd=e: QAgAv\. , v\.gAQA , gAQAsz \b/x
      end
    end
  end
  
  describe '#Bar' do
    describe 'with hash parameters' do
      before do
        @url = GoogleChart.Bar(:data => [523, 816, 614])
      end
      
      it 'begins with the Google Charts base URL' do
        @url.should =~ %r{\Ahttp://chart.apis.google.com/chart\?}
      end
      
      it 'has a default chart size' do
        @url.should =~ /\bchs=400x300\b/
      end
      
      it 'has a default chart type' do
        @url.should =~ /\bcht=bvg\b/
      end
      
      it 'has simple-encoded data' do
        @url.should =~ /\bchd=s:A9T\b/
      end
    end
    
    describe 'with block parameters' do
      before do
        @url = GoogleChart.Bar do |c|
          c.stacked = true
          c.horizontal = true
          c.data = [[5,10,15], [15,10,5], [10,5,14]]
          c.scale = 0..20
          c.encoding = :extended
        end
      end
      
      it 'has the given chart type' do
        @url.should =~ /\bcht=bhs\b/
      end
      
      it 'has the encoded data' do
        @url.should =~ /\b chd=e: QAgAv\. , v\.gAQA , gAQAsz \b/x
      end
    end
  end
end
