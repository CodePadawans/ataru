module Ataru
  class TestConverter

    def self.convert(code)
      code.gsub(/(\S+) # ?=> (\S+)/, 'assert_equal \2, \1')
    end
  end
end
