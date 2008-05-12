require 'cgi'

module GoogleChart
  module Titles
    attr_writer :title
    
    def title
      'chtt=' + CGI::escape(@title) if @title
    end
  end
end
