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

  def test_mixed
    code = "a = 1 + 2\n
    a == 3"
  end
end

