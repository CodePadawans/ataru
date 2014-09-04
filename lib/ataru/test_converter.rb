module Ataru
  class TestConverter

    def self.convert(code_sample)

      if code_sample == nil
        raise ArgumentError
      end

      if code_sample.size == 0
        return [:warning, code_sample]
      end

      before_match = code_sample.match(/(.*) #=>/)
      after_match = code_sample.match(/#=> (.*)/)

      if before_match == nil && after_match == nil
        return [:nth_to_convert, code_sample]
      end 

      if before_match == nil 
        return [:warning, code_sample]
      end

      before = before_match[1]
      after = after_match[1]

      [:ok, "assert_equal #{after}, #{before}"]
    end
  end
end
