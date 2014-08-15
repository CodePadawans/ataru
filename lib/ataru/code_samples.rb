require 'minitest'
require 'pathname'

class CodeSamples

  def self.add_test_cases(file_name, code_samples)
    basename = Pathname.new(file_name).basename(".*").to_s
    klass = Class.new(MiniTest::Test) do
      code_samples.each_with_index do |sample, index|
        define_method("test_#{basename}_#{index}") do
          eval(sample)
        end
      end
    end

    klass
  end
end

