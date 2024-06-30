class Calculator
  def add(numbers)
    delimiter = ','
    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
    end

    numbers.split(/[\n#{delimiter}]/).reduce(0) do |sum, val|
      raise(StandardError, "negative numbers not allowed #{val}") if val.to_i < 0
      val.to_i + sum
    end
  end
end
