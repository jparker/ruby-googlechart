begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'google_chart'

class MockChart < GoogleChart::AbstractChart
  def type
    'cht=mock'
  end
end
