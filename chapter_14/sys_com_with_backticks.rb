d = `date`
puts d

begin
  `datee`
rescue Errno::ENOENT => e
  puts e.message # No such file or directory - datee
end

p $? # #<Process::Status: pid 54613 exit 127>

# There’s yet another way to execute system commands from within Ruby: the %x operator
command = "date"
p %x(#{command}) # "Sun Aug 23 10:44:30 -03 2020\n"

# exec can perform the same tasks as system and backticks, but it does so by replacing the current process
# with a new shell session. This produces different behavior than system or backticks,
# which both call fork to run their commands in a subshell
# When we run exec "date", the date is returned, but our irb session is terminated
exec "ls -la"
