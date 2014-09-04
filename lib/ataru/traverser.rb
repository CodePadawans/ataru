require_relative 'markdown_loader'

module Ataru
  class Traverser
    def self.codespans(document)
      tree = document.root
      self.recurse(tree)
    end

    def self.recurse(element)
      code_samples = []
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
end
