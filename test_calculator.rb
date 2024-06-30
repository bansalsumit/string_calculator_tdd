require_relative 'calculator'
require 'test/unit'

class TestCalculator < Test::Unit::TestCase
  def test_empty_string
    calculator = Calculator.new
    output = calculator.add('')

    assert_equal(0, output)
  end
end
