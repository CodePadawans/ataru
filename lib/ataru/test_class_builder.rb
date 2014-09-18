require 'minitest'
require 'pathname'
require_relative 'errors'
require_relative 'code_sample'

module Ataru
  class TestClassBuilder
    attr_accessor :code_samples

    def initialize(code_samples)
      self.code_samples = code_samples
    end

    def build_test_class
      samples = code_samples
      klass = Class.new(MiniTest::Test) do
        samples.each_with_index do |sample, index|
          basename = Pathname.new(sample.file).basename(".*").to_s
          define_method("test_#{basename}_#{index}") do
            begin
              sample.run
            rescue StandardError => e
              raise AtaruError.new("In the file: #{sample.file}, in line: #{sample.line_number}, the code sample number: #{index} is raising an error:" + e.inspect)
            end
          end
        end
      end

      klass
    end
  end
end
