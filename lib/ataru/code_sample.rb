module Ataru
  class CodeSample
    attr_accessor :code, :file, :line_number, :prepared_code

    def initialize(code, file, line_number, prepared_code)
      self.code = code
      self.file = file
      self.line_number = line_number
      self.prepared_code = prepared_code
    end

    def ==(other)
      self.class == other.class &&
      self.file == other.file &&
        self.code == other.code &&
        self.line_number == other.line_number &&
        self.prepared_code == other.prepared_code
    end

    def run
      eval(self.prepared_code, binding, self.file, self.line_number)
    end
  end
end
