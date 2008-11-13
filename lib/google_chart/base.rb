module GoogleChart
  class Base
    @@base_url     = 'http://chart.apis.google.com/chart'
    @@default_size = '600x500'
    
    def initialize(options = {})
      options.each {|key, value| send("#{key}=", value) }
      yield self if block_given?
    end
    
    def to_url
      "#{@@base_url}?#{query_string}"
    end
    
    attr_writer :size
    
    def size
      @size ||= @@default_size
      "chs=#{@size}"
    end
    
    def self.inherited(klass)
      klass.class_eval do
        class_variable_set(:@@parameters, [])
        register!(:chart_type, :size)
      end
    end
    
    def self.register!(*parameters)
      parameters.each do |parameter|
        registry.push(parameter) unless registered?(parameter)
      end
    end
    
    def self.registered?(parameter)
      registry.include?(parameter)
    end
    
    def self.registry
      class_variable_get :@@parameters
    end
    
    private
    def query_string
      self.class.registry.map {|m| send(m) }.compact.join('&')
    end
  end
end
