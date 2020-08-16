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
