require 'minitest/autorun'
require 'kramdown'
require_relative '../lib/ataru/code_samples'
require_relative '../lib/ataru/errors'

class CodeSamplesTest < MiniTest::Test
  include Ataru

  def test_empty_list
    code_samples = []
    file_name = "my_test.md"
    klass = CodeSamples.add_test_cases(file_name, code_samples)

    refute_respond_to klass.new(nil), :test_my_test_0
  end

  def test_one_code_example
    code_samples = ["puts 'Hello world'"]
    file_name = "my_test.md"
    klass = CodeSamples.add_test_cases(file_name, code_samples)

    assert_respond_to klass.new(nil), :test_my_test_0
  end

  def test_two_code_examples
    code_samples = ["puts 'blah'", "puts 2 + 5"]
    file_name = "my_test.md"
    klass = CodeSamples.add_test_cases(file_name, code_samples)

    assert_respond_to klass.new(nil), :test_my_test_0
    assert_respond_to klass.new(nil), :test_my_test_1
  end

  def test_invalid_code_sample
    code_samples = ["a + 1"]
    file_name = "my_test.md"
    klass = CodeSamples.add_test_cases(file_name, code_samples)
    assert_raises(AtaruError) { klass.new(nil).send(:test_my_test_0) }
  end
end
