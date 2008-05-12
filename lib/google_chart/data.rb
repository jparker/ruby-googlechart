module GoogleChart
  module Data
    attr_writer :encoding
    
    @@simple_encoding   = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
    @@extended_alphabet = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a + %w[- .]
    @@extended_encoding = @@extended_alphabet.collect {|a|
      @@extended_alphabet.collect {|b| a + b }
    }.flatten
    
    def data
      'chd=' + send(:"#{encoding}_encode", @data) if @data
    end
    
    def encoding
      @encoding || :simple
    end
    
    def data=(data)
      @data = data.any? {|e| e.is_a?(Array) } ? data : [data]
    end
    
    private
    def simple_encoding
      @@simple_encoding
    end
    
    def extended_encoding
      @@extended_encoding
    end
    
    def simple_encode(data)
      's:' + data.collect {|set|
        set.collect {|n|
          case
          when n.nil?                     : '_'
          when n <= 0                     : @@simple_encoding[0]
          when n >= @@simple_encoding.size: @@simple_encoding[-1]
          else                              @@simple_encoding[n]
          end
        }.join
      }.join(',')
    end
    
    def extended_encode(data)
      'e:' + data.collect {|set|
        set.collect {|n|
          case
          when n.nil?: '__'
          when n <= 0: @@extended_encoding[0]
          when n >= @@extended_encoding.size: @@extended_encoding[-1]
          else @@extended_encoding[n]
          end
        }.join
      }.join(',')
    end
  end
end
