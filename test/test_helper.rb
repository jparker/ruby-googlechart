require 'test/unit'
require 'rubygems'
require 'mocha'
require 'redgreen' unless ENV['TM_MODE']
require File.dirname(__FILE__) + '/../lib/google_chart'

class TestChart
  def initialize(options = {})
    options.each do |key, value|
      send(:"#{key}=", value)
    end
  end
end
