require_relative 'markdown_loader'
require_relative 'code_sample'

module Ataru
  class Traverser
    CODE_ELEMENTS = [:codeblock, :codespan]

    attr_accessor :document, :language, :file_name

    def initialize(document, file_name, language = "language-ruby")
      self.document = document
      self.language = language
      self.file_name = file_name
    end

    def code_samples
      tree = document.root
      self.walk_tree(tree)
    end

    def walk_tree(element)
      code_samples = []
      element.children.each do |child|
        if CODE_ELEMENTS.include?(child.type)
          if child.attr["class"] == language
            line_number = child.options[:location] + 1
            code_samples << CodeSample.new(child.value.strip, file_name, line_number, nil)
          end
        else
          code_samples += walk_tree(child)
        end
      end
      code_samples
    end
  end
end
