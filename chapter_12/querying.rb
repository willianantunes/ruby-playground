p File.size("read_records.rb") # 559
p FileTest.size("read_records.rb") # 559
p File::Stat.new("read_records.rb").size # 559

# Does a file exist
p FileTest.exist?("/usr/local/src/ruby/README") # false
# Is the file empty?
p FileTest.empty?("read_records.rb") # false

# Is the file a directory? A regular file? A symbolic link?
p FileTest.directory?("/var/log/syslog") # false
p FileTest.file?("/var/log/syslog") # false
p FileTest.symlink?("/var/log/syslog") # false

p FileTest.readable?("/tmp") # true
p FileTest.writable?("/tmp") # true
p FileTest.executable?("/bin/rm") # true

# What is the size of this file? Is the file empty (zero bytes)?
begin
  p FileTest.size("/sbin/mkfs")
  p FileTest.zero?("/tmp/tempfile")
rescue => e
  puts "Error caught: #{e.message}"
  # Error caught: No such file or directory @ rb_file_s_size - /sbin/mkfs
end

# Much of the information available from File::Stat is built off of UNIX-like metrics, such as
# inode number, access mode (permissions), and user and group ID.
# The relevance of this information depends on your operating system.
# We won’t go into the details here because it’s not cross-platform
file_stat = File::Stat.new("read_records.rb")
p file_stat
# #<File::Stat dev=0x1000004, ino=27210268, mode=0100644, nlink=1, uid=502, gid=20, rdev=0x0,
# size=559, blksize=4096, blocks=8, atime=2020-08-16 13:47:40 -0300, mtime=2020-08-16 13:47:40 -0300,
# ctime=2020-08-16 13:47:40 -0300, birthtime=2020-08-16 13:46:29 -0300>
File.open("read_records.rb") {|f| f.stat }

