module Ataru
  class CodeSample
    attr_accessor :code, :file, :line_number

    def initialize(code, file, line_number)
      self.code = code
      self.file = file
      self.line_number = line_number
    end

    def ==(other)
      self.class == other.class &&
      self.file == other.file &&
        self.code == other.code &&
        self.line_number == other.line_number
    end

    def run
      eval(self.code, binding, self.file, self.line_number)
    end
  end
end
