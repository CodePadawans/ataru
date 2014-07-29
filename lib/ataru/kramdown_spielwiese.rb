require 'kramdown'

text = File.read("blog-tutorial.md")
doc = Kramdown::Document.new(text)
puts doc.root.inspect
puts doc.root.children.last.inspect
