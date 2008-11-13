# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-googlechart}
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Parker"]
  s.date = %q{2008-11-12}
  s.description = %q{Ruby wrapper around the Google Charts API}
  s.email = %q{jparker@urgetopunt.com}
  s.extra_rdoc_files = ["lib/google_chart/abstract_chart.rb", "lib/google_chart/axis.rb", "lib/google_chart/bar_chart.rb", "lib/google_chart/bar_style.rb", "lib/google_chart/color.rb", "lib/google_chart/data.rb", "lib/google_chart/grid_line.rb", "lib/google_chart/legend.rb", "lib/google_chart/line_chart.rb", "lib/google_chart/line_style.rb", "lib/google_chart/range_marker.rb", "lib/google_chart/title.rb", "lib/google_chart.rb", "README.txt"]
  s.files = ["History.txt", "lib/google_chart/abstract_chart.rb", "lib/google_chart/axis.rb", "lib/google_chart/bar_chart.rb", "lib/google_chart/bar_style.rb", "lib/google_chart/color.rb", "lib/google_chart/data.rb", "lib/google_chart/grid_line.rb", "lib/google_chart/legend.rb", "lib/google_chart/line_chart.rb", "lib/google_chart/line_style.rb", "lib/google_chart/range_marker.rb", "lib/google_chart/title.rb", "lib/google_chart.rb", "License.txt", "Manifest", "Rakefile", "README.txt", "ruby-googlechart.gemspec", "test/google_chart/test_abstract_chart.rb", "test/google_chart/test_axis.rb", "test/google_chart/test_bar_chart.rb", "test/google_chart/test_bar_style.rb", "test/google_chart/test_color.rb", "test/google_chart/test_data.rb", "test/google_chart/test_grid_line.rb", "test/google_chart/test_legend.rb", "test/google_chart/test_line_chart.rb", "test/google_chart/test_line_style.rb", "test/google_chart/test_range_marker.rb", "test/google_chart/test_title.rb", "test/test_google_chart.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jparker/ruby-googlechart}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ruby-googlechart", "--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ruby-googlechart}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby wrapper around the Google Charts API}
  s.test_files = ["test/google_chart/test_abstract_chart.rb", "test/google_chart/test_axis.rb", "test/google_chart/test_bar_chart.rb", "test/google_chart/test_bar_style.rb", "test/google_chart/test_color.rb", "test/google_chart/test_data.rb", "test/google_chart/test_grid_line.rb", "test/google_chart/test_legend.rb", "test/google_chart/test_line_chart.rb", "test/google_chart/test_line_style.rb", "test/google_chart/test_range_marker.rb", "test/google_chart/test_title.rb", "test/test_google_chart.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
