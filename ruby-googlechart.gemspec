# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'ruby-googlechart'
  s.version     = '0.5.0'
  s.date        = '2008-11-11'
  s.summary     = 'Ruby wrapper for the Google Charts API'
  s.email       = 'jparker@urgetopunt.com'
  s.homepage    = 'http://github.com/jparker/ruby-googlechart'
  s.description = 'ruby-googlechart is a ruby library which provides object-oriented access to the Google Charts API'
  s.has_rdoc    = false
  s.authors     = ['John Parker']
  s.files       = [
    "History.txt",
    "Manifest.txt",
    "Rakefile",
    "README.txt",
    "lib/google_chart.rb",
    "lib/google_chart/abstract_chart.rb",
    "lib/google_chart/bar.rb",
    "lib/google_chart/color.rb",
    "lib/google_chart/data.rb",
    "lib/google_chart/line.rb",
    "lib/google_chart/line_style.rb",
    "lib/google_chart/title.rb",
    "tasks/rspec.rake"
  ]
  s.test_files  = [
    "spec/spec_helper.rb",
    "spec/spec.opts",
    "spec/google_chart_spec.rb",
    "spec/google_chart/bar_spec.rb",
    "spec/google_chart/color_spec.rb",
    "spec/google_chart/data_spec.rb",
    "spec/google_chart/line_spec.rb",
    "spec/google_chart/line_style_spec.rb",
    "spec/google_chart/title_spec.rb"
  ]
  s.rdoc_options     = ['--main', 'README.txt']
  s.extra_rdoc_files = ['History.txt', 'Manifest.txt', 'README.txt']
  
  s.add_dependency('newgem', ['>= 1.0.3']
  s.add_dependency('hoe', ['>= 1.8.0'])
end
