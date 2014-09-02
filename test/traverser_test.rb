require 'minitest/autorun'
require 'kramdown'
require_relative "../lib/ataru/traverser"

class TraverserTest < Minitest::Test
  include Ataru

  def test_single_codespan
    doc = Kramdown::Document.new("`puts 'Hello'`")
    assert_equal "puts 'Hello'", Traverser.codespans(doc).first
  end

  def test_multiple_codespans
    doc = Kramdown::Document.new("`puts 'Hello'`\n `puts 'Goodbye!'`")
    assert_equal ["puts 'Hello'", "puts 'Goodbye!'"], Traverser.codespans(doc)
  end

  # def test_no_codespans
  #   doc = Kramdown::Document.new("#Header")
  #   assert_equal [], Traverser.codespans(doc)
  # end

  # def test_codespan_in_complicated_structure
  #   doc = Kramdown::Document.new(<<-MARKDOWN)
  # #Header

  # * list 1
  # * list 2 `puts 'Hello'`
  #   MARKDOWN
  #   assert_equal ["puts 'Hello'"], Traverser.codespans(doc)
  # end

end
