# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'ruby-googlechart'
  s.version     = '0.6.0'
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
    "lib/google_chart/axis.rb",
    "lib/google_chart/bar_chart.rb",
    "lib/google_chart/bar_style.rb",
    "lib/google_chart/color.rb",
    "lib/google_chart/data.rb",
    "lib/google_chart/grid_line.rb",
    "lib/google_chart/legend.rb",
    "lib/google_chart/line_chart.rb",
    "lib/google_chart/line_style.rb",
    "lib/google_chart/range_marker.rb",
    "lib/google_chart/title.rb"
  ]
  s.test_files  = [
    "test/test_helper.rb",
    "test/test_google_chart.rb",
    "test/google_chart/test_abstract_chart.rb",
    "test/google_chart/test_axis.rb",
    "test/google_chart/test_bar_chart.rb",
    "test/google_chart/test_bar_style.rb",
    "test/google_chart/test_color.rb",
    "test/google_chart/test_data.rb",
    "test/google_chart/test_grid_line.rb",
    "test/google_chart/test_legend.rb",
    "test/google_chart/test_line_chart.rb",
    "test/google_chart/test_line_style.rb",
    "test/google_chart/test_range_marker.rb",
    "test/google_chart/test_title.rb"
  ]
  s.rdoc_options     = ['--main', 'README.txt']
  s.extra_rdoc_files = ['History.txt', 'Manifest.txt', 'README.txt']
  
  s.add_dependency('newgem', ['>= 1.0.3'])
  s.add_dependency('hoe', ['>= 1.8.0'])
  s.add_dependency('thoughtbot-shoulda', ['>= 2.0.0'])
end
