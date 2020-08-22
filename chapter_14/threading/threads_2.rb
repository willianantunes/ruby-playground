# If we want to allow the thread to finish executing? To do this, we have to use the instance method join.
# The easiest way to use join is to save the thread in a variable and call join on the variable
t = Thread.new do
  puts "Starting the thread"
  sleep 1
  puts "At the end of the thread"
end
puts "Outside the thread"
t.join

# Outside the thread
# Starting the thread
# At the end of the thread
