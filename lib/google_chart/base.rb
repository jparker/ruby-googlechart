module GoogleChart
  class Base
    @@base_url = 'http://chart.apis.google.com/chart?'
    
    def initialize(options = {})
      options.each {|key, value| send(:"#{key}=", value) }
    end
    
    # Collects all of the registered parameters and creates the appropriate
    # URL variable=value pairs. The base url and these parameters are then
    # returned as a String.
    def to_url
      @@base_url + params.collect {|method, var|
        value = send(method)
        "#{var}=#{value}" if value
      }.compact.join('&')
    end
    
    # Uses #class_eval to initialize the @@params registered parameters Hash
    # for new classes which inherit from GoogleChart::Base. #class_eval must
    # be used to ensure that the class variable is created in the inheriting
    # class and not GoogleChart::Base. This prevents sibling classes from
    # polluting each others' parameter registries.
    def self.inherited(klass)
      klass.class_eval %q{
        @@params = {:size => 'chs', :type => 'cht', :data => 'chd', :colors => 'chco'}
      }
    end
    
    # Registers the given parameters with the class. This method should be
    # called from the #included method of modules which add url parameters.
    # +paramters+ should be a Hash: the keys are the human-readable names
    # of the chart paramters being added, and the values are the API-defined
    # corresponding variable names, e.g., :size => 'chs'.
    def self.register!(parameters)
      self.class_eval "@@params.merge!(#{parameters.inspect})"
    end
    
    # Chart size, data and color are common to all types of graphs, so these
    # modules are included in GoogleChart::Base.
    include GoogleChart::Sizes
    include GoogleChart::Data
    include GoogleChart::Colors
    
    protected
    # Proxies access to the parameters registry. #class_eval is used to make
    # sure the class variable being accessed exists in the calling class, not
    # GoogleChart::Base.
    def params
      self.class.class_eval '@@params'
    end
    
    # A pseudo-abstract method which forces descendent classes to implement
    # their own #type method. Like chart size and chart data, chart type is a
    # required parameter for all types of charts. However the value will vary
    # from one type to the next.
    def type
      raise "class #{self.class} must implement #type method"
    end
  end
end
