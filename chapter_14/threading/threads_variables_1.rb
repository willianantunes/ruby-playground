a = 1
# Threads run using code blocks, and code blocks can see the variables already created in their local scope
Thread.new { a = 2 }
sleep 0.1
p a # 2


t = Thread.new { Thread.stop; a = 3 }
p a # 2
t.run
sleep 0.1
p a # 3

# Global variables remain global, for the most part, in the face of threads
# But some globals are thread-local globals—for example, the $1, $2, ..., $n that are assigned the
# parenthetical capture values from the most recent regular expression–matching operation

/(abc)/.match("abc")
t = Thread.new do
  /(def)/.match("def")
  puts "$1 in thread: #{$1}"
end.join
puts "$1 outside thread: #{$1}"

# $1 in thread: def
# $1 outside thread: abc

