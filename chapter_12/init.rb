# IO objects represent readable and/or writable connections to disk files, keyboards,
# screens, and other devices. You treat an IO object like any other object: you send it messages,
# and it executes methods and returns the results
p STDERR.class
# IO
p STDERR.puts("Problem!")
# Problem!
# nil
p STDERR.write("Problem!\n")
# Problem!
# 9

# The constants STDERR, STDIN, and STDOUT are automatically set when the program starts
# IO objects as enumerables
# STDIN.each {|line| p line }

broken = true
# Error messages and STDERR are a little more involved.
# Nothing goes to STDERR unless someone tells it to.
# So if you want to use STDERR for output, you have to name it explicitly
if broken
  STDERR.puts "There's a problem!"
end
