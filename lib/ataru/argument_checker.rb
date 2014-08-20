class ArgumentChecker

  def initialize(file_names)
    exit_if_empty(file_names)
    @file_names = file_names
  end

  def exit_if_empty(file_names)
    if file_names.empty?
      puts "ataru: command line usage error"
      puts "ataru: please give the file name"
      puts "usage: ataru.rb <filename>"
      exit 64
    end
  end

  def verify(file_name)
    if file_name !~ /.+\.md/
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

  def each
    @file_names.each do |file_name|
      yield verify(file_name)
    end
  end
end

