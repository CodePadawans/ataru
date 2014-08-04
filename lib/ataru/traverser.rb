require_relative 'markdown_loader'

class Traverser
  def self.codespans(document)
    tree = document.root
    self.recurse(tree)
  end

  def self.recurse(element)
    output = []
    element.children.each do |child|
      puts "CHILD: #{child.value.inspect}"
      if child.type == :codespan
        output << child.value
      else
        output += recurse(child)
      end
    end
    output
  end
end
