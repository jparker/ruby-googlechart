require File.dirname(__FILE__) + '/spec_helper.rb'

describe GoogleChart do
  # describe '#Line' do
  #   describe 'with basic parameters' do
  #     before do
  #       @url = GoogleChart.Line(:data => [523, 816, 614])
  #     end
  #     
  #     it 'begins with the Google Charts base URL' do
  #       @url.should =~ %r{\Ahttp://chart.apis.google.com/chart\?}
  #     end
  #     
  #     it 'has a default chart size' do
  #       @url.should =~ /\bchs=400x300\b/
  #     end
  #     
  #     it 'has a default chart type' do
  #       @url.should =~ /\bcht=lc\b/
  #     end
  #     
  #     it 'uses simple encoding with the given data' do
  #       @url.should =~ /\bchd=s:A9T\b/
  #     end
  #   end
  #   
  #   describe 'with advanced parameters' do
  #     before do
  #       @url = GoogleChart.Line do |c|
  #         c.data = [[523, 816, 614], [-1, 701, 5000], [nil, 717]]
  #         c.height = 375
  #         c.width = 800
  #         c.encoding = :extended
  #       end
  #       
  #       it 'uses extended encoding with the given data' do
  #         @url.should =~ /\bchd=e:/
  #       end
  #     end
  #   end
  # end
end
