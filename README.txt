= ruby-googlechart

== DESCRIPTION:

A ruby interface to the Google Chart API. This is mostly an exercise. You may
be better off using another interface such as:

* Googlecharts (http://googlecharts.rubyforge.org/)
* Gchartrb (http://code.google.com/p/gchartrb/)

== FEATURES:

* Bar charts
* Line charts

== STILL TO DO:

* Pie charts
* Scatter plots
* Radar charts
* Google-o-Meters

== SYNOPSIS:

  GoogleChart.Bar(:data => [6,14,8,16], :color => '00aa00', :axes => {:y => true, :r => true}, :width => 20)
  
  GoogleChart.Line(:data => [[35,41], [50,33]], :color => %w[ff0000 ffcccc], :style => [:dot, :solid], :width => [2,1], :axes => {:x => 0..50, :y => true})

== REQUIREMENTS:

* FIX (list of requirements)

== INSTALL:

* FIX (sudo gem install, anything else)

== LICENSE:

(The MIT License)

Copyright (c) 2008 John Parker

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.