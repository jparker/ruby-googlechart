module GoogleChart
  module Data
    def self.included(klass)
      klass.register!(:data)
    end
    
    @@simple   = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
    alphabet   = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a + %w[- .]
    @@extended = alphabet.map {|a| alphabet.map {|b| a+b }}.flatten
    
    def data=(data)
      @data = data.any? {|e| Array === e} ? data : [data]
    end
    
    def data
      'chd=' + send("#{encoding}_encode", @data) if @data
    end
    
    attr_writer :encoding
    def encoding
      @encoding ||= :simple
    end
    
    attr_writer :scale
    def normalize(set, encoding_max)
      min, max = @scale ? [@scale.min, @scale.max] : [set.min, set.max]
      set.map {|e| (e.to_f - min) / (max - min) * encoding_max if e }
    end
    
    def simple_encode(data)
      's:' + data.map {|set|
        normalize(set, @@simple.size - 1).map {|e|
          case
          when e.nil? then '_'
          when e <= 0 then @@simple[0]
          when e >= @@simple.size then @@simple[-1]
          else @@simple[e.round]
          end
        }.join
      }.join(',')
    end
    
    def extended_encode(data)
      'e:' + data.map {|set|
        normalize(set, @@extended.size - 1).map {|e|
          case
          when e.nil? then '__'
          when e <= 0 then @@extended[0]
          when e >= @@extended.size then @@extended[-1]
          else @@extended[e.round]
          end
        }.join
      }.join(',')
    end
    
    def text_encode(data)
      't:' + data.map {|set|
        normalize(set, 100).map {|e|
          case
          when e.nil? then -1
          when e <= 0 then 0
          when e >= 100 then 100
          else
            n  = (e * 10).round
            n /= n % 10 == 0 ? 10 : 10.0
          end
        }.join(',')
      }.join('|')
    end
  end
end
