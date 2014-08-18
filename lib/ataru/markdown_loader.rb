require 'kramdown'

class MarkdownLoader
  def self.load_file(file_name)
    text = File.read(file_name)
    Kramdown::Document.new(text)
  end
end

