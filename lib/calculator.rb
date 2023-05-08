module Calculator
  class << self 
    def add(string_of_numbers)
        raise 'only accepts a string' unless string_of_numbers.is_a?(String)
        string_array = string_of_numbers.split(/[^0-9-]+/)
        integer_array = string_array.map(&:to_i)
        raise "cannot accept negatives - #{check_for_negatives(integer_array)}" if check_for_negatives(integer_array)
        integer_array.inject(0){|sum,x| x <= 1000? sum + x : sum }
    end

    private
    def check_for_negatives(numbers)
      negatives = numbers.select{ |i| i < 0 }
      negatives.join(",") if negatives.length > 0
    end
  end
end
