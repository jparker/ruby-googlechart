require 'test/unit'
require 'rubygems'
require 'mocha'
require 'redgreen' unless ENV['TM_MODE']
require File.dirname(__FILE__) + '/../lib/google_chart'

class TestChart < GoogleChart::Base
end
