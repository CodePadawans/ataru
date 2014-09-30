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
# "Require your project source code, with the correct path"

# require 'my_fancy_lib'

module Setup
def setup
# Do some nice setup that is run before every snippet
# If you'd like to use instance variables define them here, e.g
#  @important_variable_i_will_use_in_my_code_snippets = true
end

def teardown
# Do some cleanup that is run after every snippet
end

# If you like local variables you can define methods, e.g
# def number_of_wishes
#  101
# end

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

