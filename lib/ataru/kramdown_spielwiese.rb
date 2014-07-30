require 'kramdown'

text = File.read("test.md")
doc = Kramdown::Document.new(text)
root = doc.root
contents = doc.root.children

root.children.each do |child|
  puts child.type
end

root.children.each do |child|
   if child.type == :p
     child.children.each do |child|
       if child.type == :codespan
         puts child.value
       end
     end
   end
end

#puts root.inspect
#puts contents.inspect
