require 'thor'
require 'ataru'

module Ataru
  module CLI
    class Application < Thor
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__)
      end

      desc "setup", "Create the setup file containing all dependencies for running code snippets"
      def setup
        create_file(Dir.pwd + "/ataru_setup.rb") do
          <<-eos
# "Please write down ALL the dependencies needed to run the code snippets from your Markdown files"

# require path_to_your_application_source_code
# require gem 1
# require gem 2
# require gem 3
# and so on
# require ruby standard library (if applicable)
          eos
        end
        puts "hi dude, change the created ataru_setup.rb file adding your dependencies needed for your code snippets to run"
      end

      desc "gogo FILENAMES", "Run and validate code samples in given markdown files"
      def gogo(*filenames)
        path = Dir.pwd + '/ataru_setup.rb'
        require path if File.exist?(path)
        Ataru::ArgumentChecker.new(filenames).each do |checked_file|
          Ataru::Application.run_test_for_file(checked_file)
        end
      end
    end
  end
end

