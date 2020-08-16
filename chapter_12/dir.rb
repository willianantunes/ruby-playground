d = Dir.new(".")
p d
p d.entries # [".", "..", "querying.rb", "read_records.rb", "init.rb", "records.txt", "README.md", "my-file.txt", "file_ops.rb", "dir.rb", "data.out", "output.txt"]
# the class-method approach
p Dir.entries(".") # [".", "..", "querying.rb", "read_records.rb", "init.rb", "records.txt", "README.md", "my-file.txt", "file_ops.rb", "dir.rb", "data.out", "output.txt"]

def interesting_flow
  current_dir = Dir.pwd
  d = Dir.new(current_dir)
  entries = d.entries
  entries.delete_if { |entry| entry =~ /^\./ }
  entries.map! { |entry| File.join(d.path, entry) }
  entries.delete_if { |entry| !File.file?(entry) }
  print "Total bytes: " # Total bytes: 7414
  puts entries.inject(0) { |total, entry| total + File.size(entry) }
end

interesting_flow

p Dir["#{Dir.pwd}/*.rb"]
# ["/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12/querying.rb",
# "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12/read_records.rb",
# "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12/init.rb",
# "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12/file_ops.rb",
# "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12/dir.rb"]
puts "########################"
p Dir.glob("*rb") # ["querying.rb", "read_records.rb", "init.rb", "file_ops.rb", "dir.rb"]
# For example, if you want to do a case-insensitive glob, you can pass the File::FNM_CASEFOLD flag
p Dir.glob("read*", File::FNM_CASEFOLD) # ["read_records.rb", "README.md"]
# If you want to use two flags, you combine them with the bitwise OR operator,
# which consists of a single pipe character
p Dir.glob("*read*", File::FNM_DOTMATCH | File::FNM_CASEFOLD)

def manipulation_querying
  newdir = "/tmp/newdir"
  newfile = "newfile"
  Dir.mkdir(newdir)
  print "Is #{newdir} empty? "
  puts Dir.empty?(newdir)
  Dir.chdir(newdir) do
    File.open(newfile, "w") do |f|
      f.puts "Sample file in new directory"
    end
    puts "Current directory: #{Dir.pwd}"
    puts "Directory listing: "
    p Dir.entries(".")
    File.unlink(newfile)
  end
  Dir.rmdir(newdir)
  print "Does #{newdir} still exist? "
  if File.exist?(newdir)
    puts "Yes"
  else
    puts "No"
  end
end

puts "#####################"

manipulation_querying

# Is /tmp/newdir empty? true
# Current directory: /private/tmp/newdir
# Directory listing:
# [".", "..", "newfile"]
# Does /tmp/newdir still exist? No
