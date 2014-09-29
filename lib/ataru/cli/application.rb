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
# "Please require your project source code, with the correct path"

# require 'my_fancy_lib'
#
def stupid
# Do some nice setup that is run before every snippet
end

 def teardown
# Do some cleanup that is run after every snippet
end

          eos
        end
        puts "Well done, young Padawan!\nNow, change the created ataru_setup.rb file."
      end

      desc "check", "Check code snippets in all .md files of the project or, if given, specific .md files"
      def check(*filenames)
        if filenames.length == 0
          filenames = Dir.glob('**/*md')
        end
        path = Dir.pwd + '/ataru_setup.rb'
        require path if File.exist?(path)
        Ataru::ArgumentChecker.new(filenames).each do |checked_file|
          Ataru::Application.run_test_for_file(checked_file)
        end
      end
    end
  end
end

