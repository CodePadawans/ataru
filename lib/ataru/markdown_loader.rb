require 'kramdown'

class MarkdownLoader
  def self.load_file(filename)
    text = File.read(filename)
    Kramdown::Document.new(text)
  end
end

