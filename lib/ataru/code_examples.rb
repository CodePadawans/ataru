#require 'minitest/autorun'

class CodeSamples# < MiniTest::Test

  def add_test_cases(code_samples)
    @all_tests = []
    code_samples.each_with_index do |sample, index|
      current_test = self.class.send(:define_method, "test_#{index}") do
        return_value = eval(sample)
      end
      @all_tests << current_test
    end
    p @all_tests
  end

  def run_test_methods 
    @all_tests.each do |test|
      self.send(test)
    end
  end
end

