# Ruby’s threads allow you to do more than one thing at once in your program,
# through a form of time sharing: one thread executes one or more instructions and
# then passes control to the next thread, and so forth

# Ruby will try to use native operating system threading facilities,
# but if such facilities aren’t available, it will fall back on green threads
# (threads implemented completely inside the interpreter)

Thread.new do
  puts "Starting the thread"
  sleep 1
  puts "At the end of the thread"
end
sleep 0.5
puts "Outside the thread"

# Starting the thread
# Outside the thread
