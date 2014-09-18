require 'minitest/autorun'
require 'kramdown'
require_relative '../lib/ataru/test_class_builder'
require_relative '../lib/ataru/errors'
require_relative '../lib/ataru/code_sample'

class TestClassBuilderTest < MiniTest::Test
  include Ataru
  @name_of_the_runnable =  "the_name_of_the_runnable" 

  def test_empty_list
    code_samples = []
    klass = TestClassBuilder.new(code_samples).build_test_class

    refute_respond_to klass.new(@name_of_the_runnable), :test_my_test_0
  end

  def test_one_code_example
    code_samples = [CodeSample.new("puts 'Hello world'", "my_test.md", 5)]
    klass = TestClassBuilder.new(code_samples).build_test_class

    assert_respond_to klass.new(@name_of_the_runnable), :test_my_test_0
  end

  def test_two_code_examples
    code_samples = [CodeSample.new("puts 'blah'", "my_test.md", 5), CodeSample.new("puts 2 + 5", "my_test.md", 5)]
    klass = TestClassBuilder.new(code_samples).build_test_class

    assert_respond_to klass.new(@name_of_the_runnable), :test_my_test_0
    assert_respond_to klass.new(@name_of_the_runnable), :test_my_test_1
  end

  def test_invalid_code_sample
    code_samples = [CodeSample.new("a + 1", "my_test.md", 5)]
    message = AtaruError.new("In the file: #{code_samples[0].file}, in line: #{code_samples[0].line_number}, is raising an error:")
    klass = TestClassBuilder.new(code_samples).build_test_class

    assert_raises(AtaruError) { klass.new(@name_of_the_runnable).send(:test_my_test_0) }
    assert_equal "In the file: my_test.md, in line: 5, is raising an error:", message.to_s
  end

end
