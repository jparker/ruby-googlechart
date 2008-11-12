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
    "lib/google_chart/axes.rb"
    "lib/google_chart/bar.rb",
    "lib/google_chart/bar_styles.rb",
    "lib/google_chart/base.rb",
    "lib/google_chart/colors.rb",
    "lib/google_chart/data.rb",
    "lib/google_chart/grid_lines.rb",
    "lib/google_chart/legends.rb",
    "lib/google_chart/line.rb",
    "lib/google_chart/line_styles.rb",
    "lib/google_chart/range_markers.rb",
    "lib/google_chart/sizes.rb",
    "lib/google_chart/titles.rb"
  ]
  s.test_files  = [
    "test/test_helper.rb",
    "test/test_google_chart.rb",
    "test/google_chart/test_axes.rb"
    "test/google_chart/test_bar.rb",
    "test/google_chart/test_bar_styles.rb",
    "test/google_chart/test_base.rb",
    "test/google_chart/test_colors.rb",
    "test/google_chart/test_data.rb",
    "test/google_chart/test_grid_lines.rb",
    "test/google_chart/test_legends.rb",
    "test/google_chart/test_line.rb",
    "test/google_chart/test_line_styles.rb",
    "test/google_chart/test_range_markers.rb",
    "test/google_chart/test_sizes.rb",
    "test/google_chart/test_titles.rb"
  ]
  s.rdoc_options     = ['--main', 'README.txt']
  s.extra_rdoc_files = ['History.txt', 'Manifest.txt', 'README.txt']
  
  s.add_dependency('newgem', ['>= 1.0.3']
  s.add_dependency('hoe', ['>= 1.8.0'])
  s.add_dependency('thoughtbot-shoulda', ['>= 2.0.0'])
end
