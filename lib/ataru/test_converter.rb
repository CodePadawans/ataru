module Ataru
  class TestConverter

    def self.convert(code_sample)

      if code_sample.nil?
        raise ArgumentError
      end

      if code_sample.code == nil || code_sample.code.size == 0
        return [:warning, code_sample]
      end

code_sample.prepared_code = code_sample.code.gsub(/(.) # ?=> (.)/, 'assert_equal \2, \1')



      # before_match = code_sample.code.match(/((.*) #=>)|((.*) # =>)/)
      # after_match = code_sample.code.match(/(# => (.*))|(#=> (.*))/)
      #
      # if before_match == nil && after_match == nil
      #   return [:nth_to_convert, code_sample]
      # end
      #
      # if before_match == nil
      #   return [:warning, code_sample]
      # end
      #
      # before = before_match[2] || before_match[4]
      # after = after_match[2] || after_match[4]
      # [:ok, "assert_equal #{after}, #{before}"]
    end
  end
end
