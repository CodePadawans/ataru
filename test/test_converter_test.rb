require 'minitest/autorun'
require_relative '../lib/ataru/test_converter'

class TestConverterTest < MiniTest::Test

  def test_no_hash
    code = "puts 'blah'"
    converted = TestConverter.convert(code)
    other_then_nil = [:nth_to_convert, code]
    assert_equal other_then_nil, converted
  end
  # TODO that should return nth to convert ? to discuss
  def test_one_hash
    code = "a #=> 5"
    converted = TestConverter.convert(code)
    assert_equal [:ok, "assert_equal 5, a"], converted
  end

  def test_with_line_break
    code = "a = 1 + 2\na #=> 3"
    converted = TestConverter.convert(code)
    assert_equal [:ok, "assert_equal 3, a"], converted
  end

  def test_no_value_before_hash
    code = "#=> 3"
    converted = TestConverter.convert(code)
    other_then_nil = [:warning, code]
    assert_equal other_then_nil, converted
  end

  def test_nil_as_parameter
    code = nil
    assert_raises(ArgumentError) { TestConverter.convert(code) }
  end
# TODO
  def test_empty_string
    code = ""
    converted = TestConverter.convert(code)
    other_then_nil = [:nth_to_convert, code]
    assert_equal other_then_nil, converted
  end
end

