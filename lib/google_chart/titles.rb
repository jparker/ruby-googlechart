require 'cgi'

# <URL:http://code.google.com/apis/chart/#chtt>
module GoogleChart
  module Titles
    def self.included(klass)
      klass.register!(:title)
    end
    
    def title=(title)
      @title = CGI::escape(title)
    end
    
    def title
      "chtt=#{@title}" if @title
    end
  end
end
