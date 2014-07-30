require "minitest/autorun"

class RecursionTest < Minitest::Test
  def test_root_is_codespan
    doc = Kramdown::Document.new("<codespan>puts 'Hello'</codespan>")
    Traverser.codespans(doc)
  end
end
