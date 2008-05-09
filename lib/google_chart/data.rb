module GoogleChart
  module Data
    def self.included(klass)
      klass.register! :data => 'chd' unless klass == GoogleChart::Base
    end
    
    @@simple_encoding   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'.split('')
    @@extended_alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-.'.split('')
    @@extended_encoding = @@extended_alphabet.collect {|a|
      @@extended_alphabet.collect {|b| a + b }
    }.flatten
    
    protected
    def data
      send(:"#{encoding}_encoding", @data || [])
    end
    
    def data=(ds)
      @data = ds.any? {|s| s.is_a?(Array) } ? ds : [ds]
    end
    
    def encoding
      @encoding ||= :simple
    end
    
    def encoding=(e)
      @encoding = e
    end
    
    def simple_encoding(data)
      's:' + data.collect {|set| simple_encode(set) }.join(',')
    end
    
    def simple_encode(set)
      set.collect {|n|
        case
        when n.nil?
          '_'
        when n <= 0
          @@simple_encoding[0]
        when n >= @@simple_encoding.size
          @@simple_encoding[-1]
        else
          @@simple_encoding[n]
        end
      }.join
    end
    
    def extended_encoding(data)
      'e:' + data.collect {|set| extended_encode(set) }.join(',')
    end
    
    def extended_encode(set)
      set.collect {|n|
        case
        when n.nil?
          '__'
        when n <= 0
          @@extended_encoding[0]
        when n >= @@extended_encoding.size
          @@extended_encoding[-1]
        else
          @@extended_encoding[n]
        end
      }.join
    end
  end
end
