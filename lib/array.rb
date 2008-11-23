unless [].respond_to?(:sum)
  Array.class_eval do
    def sum
      inject(0) {|sum, n| sum + n }
    end
  end
end
