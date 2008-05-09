require 'cgi'

module GoogleChart
  module Titles
    def self.included(klass)
      klass.register! :title => 'chtt' unless klass == GoogleChart::Base
    end
    
    protected
    def title
      @title
    end
    
    def title=(title)
      @title = CGI::escape(title)
    end
  end
end
