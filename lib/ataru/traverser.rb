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
        code_elements = [:codeblock, :codespan]
        if code_elements.include?(child.type)
          code_samples << child.value.strip
        else
          code_samples += recurse(child)
        end
      end
      code_samples
    end
  end
end
