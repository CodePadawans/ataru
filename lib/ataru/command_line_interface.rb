#!/usr/bin/env ruby
require_relative 'markdown_loader'
require_relative 'traverser'
require_relative 'code_samples'
#puts "Welcome to Ataru! Ataru is a tool developed to test your documentation. Please write the name with the  of the markdown file, that you would like to have tested"
file_name = ARGV[0]

if file_name.nil?
  puts "ataru: please give the file name"
  puts "usage: ataru.rb <filename>"
  exit 1
elsif !(file_name =~ /.+\.md/)
  puts "ataru: markdown file required"
  exit 2 
elsif File.file?(file_name) == false
  puts "ataru: file not found"
  exit 3
end

document = load_file(file_name)
code_samples = Traverser.codespans(document)
CodeSamples.new.add_test_cases(code_samples)

require 'minitest/autorun'

