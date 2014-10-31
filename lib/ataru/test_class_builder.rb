require 'minitest'
require 'pathname'
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
        path = Dir.pwd + '/ataru_setup.rb'
        include Setup if File.exist?(path)
        samples.each_with_index do |sample, index|
          basename = Pathname.new(sample.file).basename(".*").to_s
          define_method("test_#{basename}_#{index}") do
            sample.run(binding)
          end
        end
      end

      klass
    end
  end
end
