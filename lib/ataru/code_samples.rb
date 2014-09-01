require 'minitest'
require 'pathname'
require_relative 'errors'

class CodeSamples

  def self.add_test_cases(file_name, code_samples)
    basename = Pathname.new(file_name).basename(".*").to_s
    klass = Class.new(MiniTest::Test) do
      code_samples.each_with_index do |sample, index|
        define_method("test_#{basename}_#{index}") do
          begin   
            eval(sample)
          rescue StandardError => e
            raise AtaruError.new("In the file: #{basename}, the code sample number: #{index} is raising an error: " + e.inspect)
          end   
        end
      end
    end

    klass
  end
end

