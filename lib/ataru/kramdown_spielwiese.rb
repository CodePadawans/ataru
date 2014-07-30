require 'kramdown'

text = File.read("test.md")
doc = Kramdown::Document.new(text)
root = doc.root
contents = doc.root.children

puts root.inspect
puts contents.inspect
