# In addition to having access to the usual suite of Ruby variables, threads also have their
# own variable stash—or, more accurately, a built-in hash that lets them associate symbols
# or strings with values. These thread keys can be useful

# Thread keys are basically a storage hash for thread-specific values.
# The keys must be symbols or strings. You can get at the keys by indexing the thread object directly
# with values in square brackets

t = Thread.new do
  Thread.current[:message] = "Hello"
end

t.join
p t.keys
puts t[:message]

# [:message]
# Hello

# Note that even though the thread has completed running and is now “dead,” we can still query its keys

p t.fetch(:message, "Greetings!") # "Hello"
p t.fetch(:msg, "Greetings!") # "Greetings!"
begin
  t.fetch(:msg)
rescue KeyError
  puts "Yeah! KeyError was issued!"
end

