class Calculator
  def add(numbers)
    numbers.split(',').reduce(0) do |sum, val|
      val.to_i + sum
    end
  end
end
