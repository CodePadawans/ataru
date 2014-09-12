require 'minitest/autorun'
require 'kramdown'
require_relative '../lib/ataru/test_method_builder'
require_relative '../lib/ataru/errors'
require_relative '../lib/ataru/code_sample'

class TestMethodBuilderTest < MiniTest::Test
  include Ataru
  @name_of_the_runnable =  "the_name_of_the_runnable" 

  def test_empty_list
    code_samples = []
    klass = TestMethodBuilder.new.build_test_methods(code_samples)
    refute_respond_to klass.new(@name_of_the_runnable), :test_my_test_0
  end

  def test_one_code_example
    code_samples = [CodeSample.new("puts 'Hello world'", "my_test.md")]
    klass = TestMethodBuilder.new.build_test_methods(code_samples)

    assert_respond_to klass.new(@name_of_the_runnable), :test_my_test_0
  end

  def test_two_code_examples
    code_samples = [CodeSample.new("puts 'blah'", "my_test.md"), CodeSample.new("puts 2 + 5", "my_test.md")]
    klass = TestMethodBuilder.new.build_test_methods(code_samples)

    assert_respond_to klass.new(@name_of_the_runnable), :test_my_test_0
    assert_respond_to klass.new(@name_of_the_runnable), :test_my_test_1
  end

  def test_invalid_code_sample
    code_samples = [CodeSample.new("a + 1", "my_test.md")]
    klass = TestMethodBuilder.new.build_test_methods(code_samples)

    assert_raises(AtaruError) { klass.new(@name_of_the_runnable).send(:test_my_test_0) }
  end
end
