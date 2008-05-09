require 'test/unit'
unless ENV['TM_MODE']
  require 'rubygems'
  require 'redgreen'
end
require File.dirname(__FILE__) + '/../lib/google_chart'

class TestChart < GoogleChart::Base
  protected
  def type
    @type = 'cht=foo'
  end
end
