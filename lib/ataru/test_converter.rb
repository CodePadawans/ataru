class TestConverter

  def self.convert(code_sample)
    before_match = code_sample.match(/(.*) #=>/)
    if before_match == nil 
      return nil
    end
    before = before_match[1]
    after_match = code_sample.match(/#=> (.*)/)
    after = after_match[1]

    # end
    # if before == nil || after_match == nil
    #   nil
    #
    "assert_equal #{after}, #{before}"
  end
end
