require 'minitest/autorun'
require_relative '../lib/ataru/test_converter'

class TestConverterTest < MiniTest::Test
  include Ataru

  def test_no_hash
    code_sample = CodeSample.new("puts 'blah'", "test.md", 2)
    converted = TestConverter.convert(code_sample.code)
    assert_equal "puts 'blah'", converted
  end

  def test_hash_without_context_hash_without_space
    code_sample = CodeSample.new("a #=> 5", "test.md", 2)
    converted = TestConverter.convert(code_sample.code)
    assert_equal "assert_equal(5, a)", converted
  end

  def test_hash_without_context_hash_with_space
    code_sample = CodeSample.new("a # => 5", "test.md", 2)
    converted = TestConverter.convert(code_sample.code)
    assert_equal "assert_equal(5, a)", converted
  end

  def test_hash_with_context_hash_without_space
    code_sample = CodeSample.new("a = 1 + 2\na #=> 3", "test.md", 2)
    converted = TestConverter.convert(code_sample.code)
    assert_equal "a = 1 + 2\nassert_equal(3, a)", converted
  end

  def test_hash_with_context_hash_with_space
    code_sample = CodeSample.new("a = 1 + 2\na # => 3", "test.md", 2)
    converted = TestConverter.convert(code_sample.code)
    assert_equal "a = 1 + 2\nassert_equal(3, a)", converted
  end

  def test_assertion_in_the_middle
    code_sample = CodeSample.new("a = 1 + 2\na # => 3\nb = 2", "test.md", 2)
    converted = TestConverter.convert(code_sample.code)
    assert_equal "a = 1 + 2\nassert_equal(3, a)\nb = 2", converted
  end

  def test_assertion_at_the_end
    code_sample = CodeSample.new("a = 1 + 2\nb = 2\na # => 3", "test.md", 2)
    converted = TestConverter.convert(code_sample.code)
    assert_equal "a = 1 + 2\nb = 2\nassert_equal(3, a)", converted
  end
end
