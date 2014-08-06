require_relative 'markdown_loader'

class Traverser
  def self.codespans(document)
    tree = document.root
    self.recurse(tree)
  end

  def self.recurse(element)
    output = []
    element.children.each do |child|
      if child.type == :codespan
        code_samples << child.value
      else
        code_samples += recurse(child)
      end
    end
    code_samples
  end
end
