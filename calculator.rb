class Calculator
  def add(numbers)
    operator = '+'
    delimiter = ','
    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
    end
    if delimiter == '*'
      operator = '*'
    end
    numbers = numbers.split(/[\n#{delimiter}]/).map() {|num| num.to_i}

    negatives = numbers.select { |num| num < 0 }
    if negatives.any?
      raise StandardError, "negative numbers not allowed #{negatives.join(', ')}"
    end
    initial = operator == '*' ? 1 : 0
    numbers.reduce(initial) do |total, num|
      num > 1000 ? total : total.send(operator, num)
    end
  end
end
