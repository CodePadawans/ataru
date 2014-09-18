require 'minitest/autorun'
require_relative '../lib/ataru/test_converter'

class TestConverterTest < MiniTest::Test
  include Ataru

  def test_no_hash
    code_sample = CodeSample.new("puts 'blah'", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    other_then_nil = [:nth_to_convert, code_sample]
    assert_equal other_then_nil, converted
  end

  def test_hash_without_context_hash_without_space
    code_sample = CodeSample.new("a #=> 5", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    assert_equal [:ok, "assert_equal 5, a"], converted
  end

  def test_hash_without_context_hash_with_space
    code_sample = CodeSample.new("a # => 5", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    assert_equal [:ok, "assert_equal 5, a"], converted
  end

  def test_hash_with_context_hash_without_space
    code_sample = CodeSample.new("a = 1 + 2\na #=> 3", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    assert_equal [:ok, "assert_equal 3, a"], converted
  end

  def test_hash_with_context_hash_with_space
    code_sample = CodeSample.new("a = 1 + 2\na # => 3", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    assert_equal [:ok, "assert_equal 3, a"], converted
  end

  def test_no_value_before_hash_no_context
    code_sample = CodeSample.new("#=> 3", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    other_then_nil = [:warning, code_sample]
    assert_equal other_then_nil, converted
  end

  def test_no_value_before_hash_no_context_hash_with_space
    code_sample = CodeSample.new("# => 3", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    other_then_nil = [:warning, code_sample]
    assert_equal other_then_nil, converted
  end

  def test_nil_as_parameter
    code_sample = nil
    assert_raises(ArgumentError) { TestConverter.convert(code_sample) }
  end

  def test_code_is_nil
    code_sample = CodeSample.new(nil, "test.md", 2)
    converted = TestConverter.convert(code_sample)
    other_then_nil = [:warning, code_sample]
    assert_equal other_then_nil, converted
  end

  def test_empty_string
    code_sample = CodeSample.new("", "test.md", 2)
    converted = TestConverter.convert(code_sample)
    other_then_nil = [:warning, code_sample]
    assert_equal other_then_nil, converted
  end
end
