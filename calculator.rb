class Calculator
  def add(numbers)
    delimiter = ','
    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
    end

    numbers = numbers.split(/[\n#{delimiter}]/).map() {|num| num.to_i}

    negatives = numbers.select { |num| num < 0 }
    if negatives.any?
      raise StandardError, "negative numbers not allowed #{negatives.join(', ')}"
    end

    numbers.reduce(0) do |sum, num|
      num > 1000 ? sum : num + sum
    end
  end
end
