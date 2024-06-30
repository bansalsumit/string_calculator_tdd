require_relative 'calculator'
require 'test/unit'

class TestCalculator < Test::Unit::TestCase
  def test_empty_string
    calculator = Calculator.new
    output = calculator.add('')

    assert_equal(0, output)
  end

  def test_add_string_value_1
    calculator = Calculator.new
    output = calculator.add('1')

    assert_equal(1, output)
  end

  def test_add_single_number
    calculator = Calculator.new
    output = calculator.add('8')

    assert_equal(8, output)
  end
end
