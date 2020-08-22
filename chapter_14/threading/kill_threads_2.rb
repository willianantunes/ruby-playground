t = Thread.new do
  puts "[Starting thread]"
  Thread.stop
  puts "[Resuming thread]"
end
sleep 1
puts "Status of thread: #{t.status}"
puts "Is thread stopped? #{t.stop?}"
puts "Is thread alive? #{t.alive?}"
puts
puts "Waking up thread and joining it..."
t.wakeup
t.join
puts
puts "Is thread alive? #{t.alive?}"
puts "Inspect string for thread: #{t.inspect}"

# [Starting thread]
# Status of thread: sleep
# Is thread stopped? true
# Is thread alive? true
#
# Waking up thread and joining it...
# [Resuming thread]
#
# Is thread alive? false
# Inspect string for thread: #<Thread:0x00007fcc45991768@/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_14/threading/kill_threads_2.rb:1 dead>
