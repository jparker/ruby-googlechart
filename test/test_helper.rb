require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'redgreen' unless ENV['TM_MODE']
require File.dirname(__FILE__) + '/../lib/google_chart'

class MockChart < GoogleChart::Base
  def chart_type
    'cht=mock'
  end
end
