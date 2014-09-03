require 'thor'
require 'ataru'

module Ataru
  module CLI
    class Application < Thor
      desc "gogo FILENAMES", "Run and validate code samples in given markdown files"
      def gogo(*filenames)
        Ataru::ArgumentChecker.new(filenames).each do |checked_file|
          Ataru::Application.run_test_for_file(checked_file)
        end
      end
    end
  end
end


