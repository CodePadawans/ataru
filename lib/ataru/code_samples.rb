require 'minitest'

class CodeSamples

  def self.add_test_cases(file_name, code_samples)
    klass = Class.new(MiniTest::Test) do
      def name
        self.class.name
      end
      code_samples.each_with_index do |sample, index|
        define_method("#{file_name}_test_#{index}") do
          eval(sample)
        end
      end
    end
   #modity filename to be a class name, stick it to a var and pass this var in the next line 
      CodeSamples.const_set(file_name, klass)
    puts klass.name
    puts klass.methods.map{ |m| m.to_s} 
  end
end

