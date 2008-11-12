= ruby-googlechart

* http://github.com/jparker/ruby-googlechart

== DESCRIPTION:

ruby-googlechart is a ruby library which provides object-oriented
access to the Google Charts API.

This library has largely been done as an exercise. These other ruby
libraries are more mature and may be better suited to your needs:

* http://googlecharts.rubyforge.org/
* http://code.google.com/p/gchartrb/

== FEATURES/PROBLEMS:

* Limited support for Line and Bar charts

== SYNOPSIS:
  
  url = GoogleChart.Line(:data => [1, nil, 2, 8, 1])
  
  url = GoogleChart.Line do |c|
    c.type     = :line
    c.size     = '800x375'
    c.data     = [335, 285, 240, 220, 160, 175, 200, 205]
    c.scale    = 0..400
    c.encoding = :extended
    c.title    = 'Chart Title'
  end

== REQUIREMENTS:

* newgem >= 1.0.3
* hoe >= 1.8.0

== INSTALL:

* sudo gem install jparker-ruby-googlechart -s http://gems.github.com/

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