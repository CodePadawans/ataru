#require 'minitest/autorun'

class CodeExamples# < MiniTest::Test
  def initialize
  end

  def add_test_cases(code)
    all_tests = []
    code.each_with_index do |snippet, index|
      current_test = self.class.send(:define_method, "test_#{index}") do
      return_value = eval(snippet)
      end
      all_tests << current_test
    end
    p all_tests
  end

  def gather_methods

  end
end

c = CodeExamples.new
c.add_test_cases(['puts "blah"', 'puts "omg"'])


