module Ataru
  class Application
    def self.run_test_for_file(file_name)

      #creating kramdown doc out of md file
      kramdown_doc = MarkdownLoader.load_file(file_name)
      #pulling an array of codespans/code samples from markdown document
      code_samples = Traverser.new(kramdown_doc, file_name).code_samples

      code_samples = code_samples.map do |sample|
        status, assertion = TestConverter.convert(sample)

        if status == :ok
          sample += assertion
        end
        sample
      end

      #wrapping code samples in minitest tests
      CodeSamples.add_test_cases(file_name, code_samples)
      require 'minitest/autorun'
    end
  end
end
