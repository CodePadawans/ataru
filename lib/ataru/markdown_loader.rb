require 'kramdown'

module Ataru
  class MarkdownLoader
    def self.load_file(file_name)
      text = File.read(file_name)
      Kramdown::Document.new(text, :input => 'GFM')
    end
  end
end
