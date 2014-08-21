require 'minitest/autorun'
require_relative '../lib/ataru/test_converter'

class TestConverterTest < MiniTest::Test

  def test_no_hash
    code = "puts 'blah'"
    converted = TestConverter.convert(code)
    assert_equal nil, converted
  end

  def test_one_hash
    code = "a #=> 5"
    converted = TestConverter.convert(code)
    assert_equal "assert_equal 5, a", converted
  end

  def test_with_line_break
    code = "a = 1 + 2\na #=> 3"
    converted = TestConverter.convert(code)
    assert_equal "assert_equal 3, a", converted
  end

  def test_no_value_before_hash
    code = "#=> 3"
    converted = TestConverter.convert(code)
    assert_equal nil, converted
  end

  def test_nil_as_parameter
    code = nil
    assert_raises(ArgumentError) { TestConverter.convert(code) }
  end

  # def test_empty_string
  #   code = ""
  #   converted = TestConverter.convert(code)
  #   assert_equal "error", converted
  # end
end

