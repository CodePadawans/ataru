class TestConverter

  def self.convert(code_sample)
    if code_sample == nil
      raise ArgumentError
    end
    before_match = code_sample.match(/(.*) #=>/)
    after_match = code_sample.match(/#=> (.*)/)

    if before_match == nil && after_match == nil
      other_than_nil = [:nth_to_convert,code_sample ]
      return other_than_nil
    elsif before_match == nil && after_match != nil
      return [:warning, code_sample]
    end
    before = before_match[1]
    after = after_match[1]

    # end
    # if before == nil || after_match == nil
    #   nil
    #
    [:ok, "assert_equal #{after}, #{before}"]
  end
end
