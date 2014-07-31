require "minitest/autorun"
require "kramdown"

class RecursionTest < Minitest::Test
  def test_single_codespan
    doc = Kramdown::Document.new("`puts 'Hello'`")
    assert_equal ["puts 'Hello'"], Traverser.codespans(doc)
  end

  def test_multiple_codespans
    doc = Kramdown::Document.new("`puts 'Hello'\n `puts 'Goodbye!'`")
    assert_equal ["puts 'Hello'", "puts 'Goodbye!'"], Traverser.codespans(doc)
  end

  def test_no_codespans
    doc = Kramdown::Document.new("#Header")
    assert_equal [], Traverser.codespans(doc)
  end

  def test_codespan_in_complicated_structure
    doc = Kramdown::Document.new(<<-MARKDOWN)
#Header

  * list 1
  * list 2 `puts 'Hello'`
    MARKDOWN
    assert_equal ["puts 'Hello'"], Traverser.codespans(doc)
  end

end

module Traverser
  def self.codespans(document)
    document.root.children.each do |child|
      if child.type == :p
        child.children.each do |child|
          if child.type == :codespan
            return child.value
          end
        end
      end
    end
  end
end
