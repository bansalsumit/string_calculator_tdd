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

  def test_add_two_numbers
    calculator = Calculator.new
    output = calculator.add('8,7')

    assert_equal(15, output)
  end

  def test_add_numbers_with_newlines
    calculator = Calculator.new
    output = calculator.add("1\n2,3")

    assert_equal(6, output)
  end

  def test_add_numbers_with_custom_delimiter
    calculator = Calculator.new
    output = calculator.add("//;\n1;2") # format "//[delimiter]\n[numbers…]"

    assert_equal(3, output)
  end

  def test_add_numbers_with_negative_number
    calculator = Calculator.new
    error = assert_raises(StandardError) { calculator.add("//;\n1;-2") } # format "//[delimiter]\n[numbers…]"

    assert_equal('negative numbers not allowed -2', error.message)
  end

  def test_add_numbers_with_negative_numbers
    calculator = Calculator.new
    error = assert_raises(StandardError) { calculator.add("//;\n1;-2;-7") } # format "//[delimiter]\n[numbers…]"

    assert_equal('negative numbers not allowed -2, -7', error.message)
  end

  def test_add_numbers_with_bigger_than_1000
    calculator = Calculator.new
    output = calculator.add("1\n2,3\n1001")

    assert_equal(6, output)
  end
end
