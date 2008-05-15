module GoogleChart
  # Classes implementing a specific chart type should inherit from Base which
  # provides a useable #initialize method and establishes a registry of chart
  # parameters which is used when building the URL.
  class Base
    @@base_url = 'http://chart.apis.google.com/chart?'
    
    def initialize(options = {})
      options.each do |key, value|
        send(:"#{key}=", value)
      end
    end
    
    # This initializes the @@registry class variable within the scope of the
    # descendent class where it won't interfere with sibling classes.
    def self.inherited(klass)
      klass.class_eval '@@registry = []'
    end
    
    # Adds the given paremters to the parameter registry. Modules implementing
    # specific chart parameters should define an #included class method from
    # which to send #register! to the class including the module. The arguments
    # to #register! should be one or more symbols representing methods to be
    # called to retrieve specific chart parameters. Those methods should be
    # defined in the module.
    def self.register!(*parameters)
      registry.push(*parameters)
    end
    
    # Collect all of the registered chart parameters and join them together
    # to form the URL for the chart to be generated.
    def to_url
      @@base_url + self.class.registry.collect {|p| send(p) }.compact.join('&')
    end
    
    private
    # Proxies access to the parameter registry. The proxy is necessary to
    # ensure the class variable being accessed lives in Base's descendent.
    def self.registry
      class_eval '@@registry'
    end
  end
end
