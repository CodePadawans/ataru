require 'kramdown'

def load_file(filename)
  text = File.read(filename)
  Kramdown::Document.new(text)
end

