module GoogleChart
  class AbstractChart
    @@base_url = 'http://chart.apis.google.com/chart'
    
    def self.inherited(klass)
      klass.class_eval do
        class_variable_set(:@@parameters, [])
        register!(:type, :size)
        
        include Data
      end
    end
    
    def self.register!(*parameters)
      parameters.each do |parameter|
        registry.push(parameter) unless registered?(parameter)
      end
    end
    
    def self.registered?(parameter)
      registry.include? parameter
    end
    
    def self.registry
      class_variable_get(:@@parameters)
    end
    
    def initialize(options = {})
      options.each {|key, value| send("#{key}=", value) }
      yield self if block_given?
    end
    
    def to_url
      "#{@@base_url}?#{query_string}"
    end
    
    def type
      raise "#{self.class} does not define required method #type"
    end
    
    attr_writer :size
    
    def size
      @size ||= '400x300'
      "chs=#{@size}"
    end
    
    private
    def query_string
      self.class.registry.map {|m| send(m) }.compact.join('&')
    end
  end
end
