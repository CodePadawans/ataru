require 'minitest/autorun'
require 'kramdown'
require_relative '../lib/ataru/code_samples'

class CodeSamplesTest < MiniTest::Test
  def setup
    @examples = CodeSamples.new
  end
  def test_empty_list
    list = []
    klass = @examples.add_test_cases(list)
    assert_equal false, klass.new(nil).methods.include?(:test_0)
  end

  def test_one_code_example
    list = ["puts 'Hello world'"]
    klass = @examples.add_test_cases(list)
    assert_equal true, klass.new(nil).methods.include?(:test_0)
  end

  def test_two_code_examples
    list = ["puts 'blah'", "puts 2 + 5"]
    klass = @examples.add_test_cases(list)
    assert_equal true, klass.new(nil).methods.include?(:test_1)
  end
end
