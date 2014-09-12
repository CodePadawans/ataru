require 'minitest'
require 'pathname'
require_relative 'errors'
require_relative 'code_sample'

module Ataru
  class TestMethodBuilder

    def initialize
    end

    def build_test_methods(code_samples)
      klass = Class.new(MiniTest::Test) do
        code_samples.each_with_index do |sample, index|
          basename = Pathname.new(sample.file).basename(".*").to_s
          define_method("test_#{basename}_#{index}") do
            begin
              sample.run
            rescue StandardError => e
              raise AtaruError.new("In the file: #{basename}, the code sample number: #{index} is raising an error: " + e.inspect)
            end
          end
        end
      end

      klass
    end
  end
end
