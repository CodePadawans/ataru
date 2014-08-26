class TestConverter

  def self.convert(code_sample)
    if code_sample == nil
      raise ArgumentError
    end
    before_match = code_sample.match(/(.*) #=>/)
    after_match = code_sample.match(/#=> (.*)/)

    #maybe write if there is no =>  ??
    #but then we have two cases - empty sting (possible warning, and legitimate line of code, just without a => )
    if before_match == nil && after_match == nil
      other_than_nil = [:nth_to_convert, code_sample]
      return other_than_nil
    elsif before_match == nil && after_match != nil
      return [:warning, code_sample]
    end
    before = before_match[1]
    after = after_match[1]

    [:ok, "assert_equal #{after}, #{before}"]
  end
end
