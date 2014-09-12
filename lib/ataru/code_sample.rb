module Ataru
  class CodeSample
    attr_accessor :code, :file

    def initialize(code, file)
      self.code = code
      self.file = file
    end

    def ==(other)
      self.file == other.file &&
        self.code == other.code
    end

    def run
      eval(self.code)
    end
  end
end
