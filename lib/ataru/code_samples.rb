require 'minitest'
require_relative '../bin/ataru'

class CodeSamples

  def self.add_test_cases(code_samples)
    klass = Class.new(MiniTest::Test) do
      def name
        self.class.name
      end
      CodeSamples.const_set(file_name, klass)
      code_samples.each_with_index do |file_name, sample, index|
        define_method("#{file_name}_test_#{index}") do
          eval(sample)
        end
      end
    end
    puts klass.method(:to_s).name
    puts klass.methods.map{ |m| m.to_s} 
  end
end

