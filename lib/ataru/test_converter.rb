class TestConverter

  def self.convert(code_sample)
    before = code_sample.match(/(.*) #=>/)[1]
    after = code_sample.match(/#=> (.*)/)[1]
    if before == nil || after == nil
      nil
    else
      p "assert_equal #{after}, #{before}"
    end

  end
end
