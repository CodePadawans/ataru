require 'minitest/autorun'
require_relative '../lib/ataru/code_sample'

class CodeSampleTest < MiniTest::Test
  include Ataru

  class TestException < Exception
  end

  def test_run_with_file_name_and_line_number
    code = CodeSample.new("1\n raise TestException.new('bad stuff')", "test.md", 1)
    b = binding
    begin
      code.run(b)
    rescue TestException => e
      e.backtrace.first
      file_name = e.backtrace.first.split(":").first
      line_number = e.backtrace.first.split(":")[1].to_i
    end

    assert_equal "test.md", file_name
    assert_equal 2, line_number
  end
end
