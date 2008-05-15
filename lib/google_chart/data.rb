# <URL:http://code.google.com/apis/chart/#chart_data>
module GoogleChart
  module Data
    def self.included(klass)
      klass.register!(:data)
    end
    
    attr_writer :encoding, :scale
    
    @@simple_encoding   = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
    @@extended_alphabet = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a + %w[- .]
    @@extended_encoding = @@extended_alphabet.collect {|a|
      @@extended_alphabet.collect {|b| a + b }
    }.flatten
    
    def data
      'chd=' + send(:"#{encoding}_encode", @data) if @data
    end
    
    def data=(data)
      @data = data.any? {|e| e.is_a?(Array) } ? data : [data]
    end
    
    private
    def encoding
      @encoding || :simple
    end
    
    def scale?
      @scale
    end
    
    def scale_set(set, range)
      if scale?
        min, max = set.min, set.max
        if min < 0
          set.collect! {|n| n - min }
          max -= min
        end
        set.collect {|n| (n * range).to_f / max if n }
      else
        set
      end
    end
    
    def simple_encode(data)
      's:' + data.collect {|set|
        scale_set(set, @@simple_encoding.size - 1).collect {|n|
          case
          when n.nil? then '_'
          when n <= 0 then @@simple_encoding[0]
          when n >= @@simple_encoding.size then @@simple_encoding[-1]
          else @@simple_encoding[n.round]
          end
        }.join
      }.join(',')
    end
    
    def extended_encode(data)
      'e:' + data.collect {|set|
        scale_set(set, @@extended_encoding.size - 1).collect {|n|
          case
          when n.nil? then '__'
          when n <= 0 then @@extended_encoding[0]
          when n >= @@extended_encoding.size then @@extended_encoding[-1]
          else @@extended_encoding[n.round]
          end
        }.join
      }.join(',')
    end
    
    def text_encode(data)
      't:' + data.collect {|set|
        scale_set(set, 100).collect {|n|
          case
          when n.nil? then -1
          when n < 0 then 0
          when n > 100 then 100
          else
            # More than one decimal place yields negligible resolution at the
            # potentially great cost of one extra character in the URL. Avoid
            # this by rounding to the nearest tenth. Further round down to an
            # integer when possible to save the extra two characters (".0").
            m = (n * 10).round
            m / (m % 10 == 0 ? 10 : 10.0)
          end
        }.join(',')
      }.join('|')
    end
  end
end
