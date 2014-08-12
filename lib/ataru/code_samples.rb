require 'minitest'

class CodeSamples

  def add_test_cases(code_samples)
    Class.new(MiniTest::Test) do
      code_samples.each_with_index do |sample, index|
        define_method("test_#{index}") do
          eval(sample)
        end
      end
    end
  end
end

