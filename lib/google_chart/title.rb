module GoogleChart
  module Title
    def self.included(klass)
      klass.register!(:title)
    end
    
    attr_writer :title
    
    def title
      "chtt=#{CGI::escape(@title)}" if @title
    end
  end
end
