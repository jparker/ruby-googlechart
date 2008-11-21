# <URL:http://code.google.com/apis/chart/#chart_data>
module GoogleChart
  module Data
    def self.included(klass)
      klass.register!(:data)
    end
    
    attr_writer :encoding, :scale
    
    @@simple   = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
    alphabet   = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a + %w[- .]
    @@extended = alphabet.map {|a| alphabet.map {|b| a + b }}.flatten
    
    def data=(data)
      @data = data.any? {|e| Array === e } ? data : [data]
    end
    
    def data
      'chd=' + send(:"#{encoding}_encode", @data) if @data
    end
    
    private
    def encoding
      @encoding ||= :simple
    end
    
    def scale
      if @scale.nil?
        min = [0, @data.map {|set| set.compact.min }.min].compact.min
        max = @data.map {|set| set.compact.max }.compact.max
        @scale = min..max
      end
      @scale
    end
    
    def normalize(set, encoding_max)
      min, max = scale.first, scale.last
      if min != max
        set.map {|e| (e.to_f - min) / (max - min) * encoding_max if e }
      else
        set
      end
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
        normalize(set, @@extended.size - 1).collect {|e|
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
          when e < 0 then 0
          when e > 100 then 100
          else
            # More than one decimal place yields negligible resolution at the
            # potentially great cost of one extra character in the URL. Avoid
            # this by rounding to the nearest tenth. Further round down to an
            # integer when possible to save the extra two characters (".0").
            n = (e * 10).round
            n / (n % 10 == 0 ? 10 : 10.0)
          end
        }.join(',')
      }.join('|')
    end
  end
end
