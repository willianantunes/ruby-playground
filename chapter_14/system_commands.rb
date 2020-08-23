# The system method calls a system program. Backticks (``) call a system program and return its output.
# The exec method replaces the current process by returning an external command.

system("date")

# cat and grep require pressing Ctrl-D
# system("cat")
# system('grep "D"')

p system("datee") # nil
# The $? variable is thread local:
# if you call a program in one thread, its return value affects only the $? in that thread
p $? # #<Process::Status: pid 53799 exit 127>

puts "#########"

p system("date")
# Sun Aug 23 10:38:52 -03 2020
# true
p $?
# #<Process::Status: pid 54466 exit 0>
p Thread.new { system("datee"); p $? }.join
# #<Process::Status: pid 54467 exit 127>
# #<Thread:0x00007f83f8148f38@/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_14/system_commands.rb:19 dead>
p $?
# #<Process::Status: pid 54466 exit 0>
