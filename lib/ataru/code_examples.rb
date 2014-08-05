#require 'minitest/autorun'

class CodeExamples# < MiniTest::Test
  def initialize
  end

  def add_test_cases(code)
    code.each_with_index do |snippet, index|
      self.class.send(:define_method, "test_#{index}") do 
        puts "i'm the snippet"
      end
    end
  end
end
c = CodeExamples.new
c.add_test_cases(["puts 'blah'"])
c.test_0
