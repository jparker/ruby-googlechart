require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::Data do
  before do
    @klass = Class.new(MockChart)
  end
  
  it 'registers with the parameter registry' do
    @klass.registry.should include(:data)
  end
  
  it 'uses simple encoding by default' do
    @klass.new(:data => [0,1,60,61]).data.should =~ /\bchd=s:/
  end
  
  describe 'simple encoding' do
    it 'correctly encodes data using automatic scaling' do
      @klass.new(:data => [5,10,15], :encoding => :simple).data.should == 'chd=s:Af9'
    end
    
    it 'correctly encodes data using manual scaling' do
      @klass.new(:data => [5,10,15], :scale => 0..20, :encoding => :simple).data.should == 'chd=s:Pfu'
    end
    
    it 'correctly scales data with automatic scaling to fit within encoding range' do
      @klass.new(:data => [-100,0,100], :encoding => :simple).data.should == 'chd=s:Af9'
    end
    
    it 'correctly scales data with manual scaling to fit within encoding range' do
      @klass.new(:data => [-100,0,100], :scale => -200..200, :encoding => :simple).data.should == 'chd=s:Pfu'
    end
    
    it 'correctly encodes overrun and underrun data' do
      @klass.new(:data => [-100,0,100], :scale => -5..5, :encoding => :simple).data.should == 'chd=s:Af9'
    end
    
    it 'correctly encodes multiple data sets' do
      @klass.new(:data => [[9,15], [24,7]], :scale => 0..61, :encoding => :simple).data.should == 'chd=s:JP,YH'
    end
    
    it 'correctly encodes missing data' do
      @klass.new(:data => [50,nil,33], :scale => 0..61, :encoding => :simple).data.should == 'chd=s:y_h'
    end
    
    it 'correctly encodes floating point data' do
      @klass.new(:data => [50.49,32.50], :scale => 0..61, :encoding => :simple).data.should == 'chd=s:yh'
    end
  end
  
  describe 'extended encoding' do
    it 'correctly encodes data using automatic scaling' do
      @klass.new(:data => [5,10,15], :encoding => :extended).data.should == 'chd=e:AAgA..'
    end
    
    it 'correctly encodes data using manual scaling' do
      @klass.new(:data => [5,10,15], :scale => 0..20, :encoding => :extended).data.should == 'chd=e:QAgAv.'
    end
    
    it 'correctly scales data with automatic scaling to fit within encoding range' do
      @klass.new(:data => [-5_000,0,5_000], :encoding => :extended).data.should == 'chd=e:AAgA..'
    end
    
    it 'correctly scales data with manual scaling to fit within encoding range' do
      @klass.new(:data => [-5_000,0,5_000], :scale => -10_000..10_000, :encoding => :extended).data.should == 'chd=e:QAgAv.'
    end
    
    it 'correctly encodes overrun and underrun data' do
      @klass.new(:data => [-100,0,100], :scale => -5..5, :encoding => :extended).data.should == 'chd=e:AAgA..'
    end
    
    it 'correctly encodes multiple data sets' do
      @klass.new(:data => [[2_281,3_233], [591,1_543]], :scale => 0..4095, :encoding => :extended).data.should == 'chd=e:jpyh,JPYH'
    end
    
    it 'correctly encodes missing data' do
      @klass.new(:data => [2_281,nil,3_233], :scale => 0..4095, :encoding => :extended).data.should == 'chd=e:jp__yh'
    end
    
    it 'correctly encodes floating point data' do
      @klass.new(:data => [2_281.49,3_232.50], :scale => 0..4095, :encoding => :extended).data.should == 'chd=e:jpyh'
    end
  end
  
  describe 'text encoding' do
    it 'correctly encodes data using automatic scaling' do
      @klass.new(:data => [5,10,15], :encoding => :text).data.should == 'chd=t:0,50,100'
    end
    
    it 'correctly encodes data using manual scaling' do
      @klass.new(:data => [5,10,15], :scale => 0..20, :encoding => :text).data.should == 'chd=t:25,50,75'
    end
    
    it 'correctly scales data with automatic scaling to fit within encoding range' do
      @klass.new(:data => [-100,0,100], :encoding => :text).data.should == 'chd=t:0,50,100'
    end
    
    it 'correctly scales data with manual scaling to fit within encoding range' do
      @klass.new(:data => [-100,0,100], :scale => -200..200, :encoding => :text).data.should == 'chd=t:25,50,75'
    end
    
    it 'correctly encodes overrun and underrun data' do
      @klass.new(:data => [-100,0,100], :scale => -5..5, :encoding => :text).data.should == 'chd=t:0,50,100'
    end
    
    it 'correctly encodes multiple data sets' do
      @klass.new(:data => [[6,14], [5,23]], :scale => 0..100, :encoding => :text).data.should == 'chd=t:6,14|5,23'
    end
    
    it 'correctly encodes missing data' do
      @klass.new(:data => [6,nil,14], :scale => 0..100, :encoding => :text).data.should == 'chd=t:6,-1,14'
    end
    
    it 'rounds floating point data to the nearest 10th' do
      @klass.new(:data => [5.95, 14.01, 5.23], :scale => 0..100, :encoding => :text).data.should == 'chd=t:6,14,5.2'
    end
  end
end
