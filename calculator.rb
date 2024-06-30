class Calculator
  def add(numbers)
    numbers.split(',').sum(0) do |val, sum|
      val.to_i + sum.to_i
    end
  end
end
