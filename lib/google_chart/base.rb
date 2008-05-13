module GoogleChart
  class Base
    @@base_url = 'http://chart.apis.google.com/chart?'
    
    def initialize(options = {})
      options.each do |key, value|
        send(:"#{key}=", value)
      end
    end
    
    def self.inherited(klass)
      klass.class_eval '@@registry = []'
    end
    
    def self.register!(*parameters)
      registry.push(*parameters)
    end
    
    def self.registry
      class_eval '@@registry'
    end
    
    def to_url
      @@base_url + self.class.registry.collect {|p| send(p) }.join('&')
    end
  end
end
