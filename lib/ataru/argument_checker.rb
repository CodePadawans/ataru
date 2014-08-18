class ArgumentChecker
  def self.check(file_name)
    if file_name.nil?
      puts "ataru: command line usage error"
      puts "ataru: please give the file name"
      puts "usage: ataru.rb <filename>"
      exit 64
    elsif file_name !~ /.+\.md/
      puts "ataru: data format error"
      puts "ataru: #{file_name} is not a markdown file"
      puts "ataru: markdown file required"
      exit 65
    elsif File.file?(file_name) == false
      puts "ataru: cannot open input"
      puts "ataru: #{file_name} file not found"
      exit 66
    else
      file_name
    end
  end
end

