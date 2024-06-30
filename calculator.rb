class Calculator
  def add(numbers)
    delimiter = ','
    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
    end

    negatives = numbers.split(/[\n#{delimiter}]/).select { |num| num.to_i < 0 }
    if negatives.any?
      raise StandardError, "negative numbers not allowed #{negatives.join(', ')}"
    end

    numbers.split(/[\n#{delimiter}]/).reduce(0) do |sum, val|
      val.to_i > 1000 ? sum : val.to_i + sum
    end
  end
end
