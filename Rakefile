require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('ruby-googlechart', '0.6.1') do |p|
  p.description     = 'Ruby wrapper around the Google Charts API'
  p.url             = 'http://github.com/jparker/ruby-googlechart'
  p.author          = 'John Parker'
  p.email           = 'jparker@urgetopunt.com'
  p.ignore_pattern  = %w[tmp/* script/*]
  # p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each {|ext| load ext }
