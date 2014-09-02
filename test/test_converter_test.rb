require 'minitest/autorun'
require_relative '../lib/ataru/test_converter'

class TestConverterTest < MiniTest::Test
  include Ataru

  def test_no_hash
    code = "puts 'blah'"
    converted = TestConverter.convert(code)
    other_then_nil = [:nth_to_convert, code]
    assert_equal other_then_nil, converted
  end

  def test_hash_without_context
    code = "a #=> 5"
    converted = TestConverter.convert(code)
    assert_equal [:ok, "assert_equal 5, a"], converted
  end

  def test_hash_with_context
    code = "a = 1 + 2\na #=> 3"
    converted = TestConverter.convert(code)
    assert_equal [:ok, "assert_equal 3, a"], converted
  end

  def test_no_value_before_hash_no_context
    code = "#=> 3"
    converted = TestConverter.convert(code)
    other_then_nil = [:warning, code]
    assert_equal other_then_nil, converted
  end

  def test_nil_as_parameter
    code = nil
    assert_raises(ArgumentError) { TestConverter.convert(code) }
  end

  def test_empty_string
    code = ""
    converted = TestConverter.convert(code)
    other_then_nil = [:warning, code]
    assert_equal other_then_nil, converted
  end
end
