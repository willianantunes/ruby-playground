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
