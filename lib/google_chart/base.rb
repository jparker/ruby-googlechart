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
    # descendent class where it won't interfere with sibling classes. The
    # registry is initialized with the chart_type parameters which descendent
    # classes are required to implement.
    def self.inherited(klass)
      klass.class_eval do
        class_variable_set(:@@registry, [])
        register!(:chart_type)
      end
    end
    
    # Adds the given paremters to the parameter registry. Modules implementing
    # specific chart parameters should define an #included class method from
    # which to send #register! to the class including the module. The argument
    # to #register! should be one a symbol representing the method to be
    # called to retrieve a specific chart parameter. That method should be
    # defined in the module. A module may call #register! multiple times if
    # more than one parameter must be registered.
    def self.register!(parameter)
      registry << parameter
    end
    
    # Collect all of the registered chart parameters and join them together
    # to form the URL for the chart to be generated.
    def to_url
      @@base_url + self.class.registry.collect {|p| send(p) }.compact.join('&')
    end
    
    private
    # Proxy access to the parameter registry.
    def self.registry
      class_variable_get :@@registry
    end
  end
end
