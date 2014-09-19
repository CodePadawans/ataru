  module Ataru
    class TestConverter

      def self.convert(code_sample)

  code_sample.prepared_code = code_sample.code.gsub(/(\S+) # ?=> (\S+)/, 'assert_equal \2, \1')

      end
    end
  end
