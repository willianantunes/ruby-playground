# Using the open family of methods to call external programs is a lot more complex than using system and backticks

d = open("|cat", "w+")
d.puts "Hello to cat"
d.close
p d # #<IO:(closed)>

# The call to open is generic; it could be any I/O stream,
# but in this case it’s a two-way connection to a system command

p open("|cat", "w+") {|p| p.puts("hi"); p.gets } # "hi\n"

# The Open3.popen3 method opens communication with an external program and gives you handles
# on the external program’s standard input, standard output, and standard error streams

require 'open3'

stdin, stdout, stderr = Open3.popen3("cat")
p stdin.puts("Hi.\nBye") # nil
p stdout.gets # "Hi.\n"
p stdout.gets # "Bye\n"

puts "#########"

# If you run this program, remember that it loops forever,
# so you’ll have to interrupt it with Ctrl-C (or whatever your system uses for an interrupt signal)
stdin, stdout, stderr = Open3.popen3("cat")

t = Thread.new do
  loop { stdin.puts gets }
end
u = Thread.new do
  n = 0
  str = ""
  loop do
    str << stdout.gets
    n += 1
    if n % 3 == 0
      puts "--------\n"
      puts str
      puts "--------\n"
      str = ""
    end
  end
end

t.join
u.join

