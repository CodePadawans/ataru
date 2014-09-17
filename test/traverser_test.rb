require 'minitest/autorun'
require 'kramdown'
require_relative "../lib/ataru/traverser"

class TraverserTest < Minitest::Test

  include Ataru

  def test_single_codespan
    doc = Kramdown::Document.new("```ruby\nputs 'Hello'\n```", :input => 'GFM')
    assert_equal CodeSample.new("puts 'Hello'", "test.md", 2), Traverser.new(doc, "test.md").code_samples.first
  end

  def test_multiple_codespans
    doc = Kramdown::Document.new("```ruby\nputs 'Hello'\n```\n```ruby\nputs 'Goodbye!'\n```", :input => 'GFM')
    assert_equal [CodeSample.new("puts 'Hello'", "test.md", 2), CodeSample.new("puts 'Goodbye!'", "test.md", 5)], Traverser.new(doc, "test.md").code_samples

  end

  def test_no_codespans
    doc = Kramdown::Document.new("#Header", :input => 'GFM')
    assert_equal [], Traverser.new(doc, "test.md").code_samples
  end

  def test_codespan_in_complicated_structure
    doc = Kramdown::Document.new <<-MARKDOWN, :input => 'GFM'
#Header

* list 1
* list 2

```ruby
puts 'Hello'
```
MARKDOWN
    assert_equal [CodeSample.new("puts 'Hello'", "test.md", 7)], Traverser.new(doc, "test.md").code_samples
  end
end
