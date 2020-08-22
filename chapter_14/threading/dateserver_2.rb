require 'socket'

# After you run this code, type "telnet localhost 3939" on you terminal
# What if you want the server to field multiple requests?
# Easy: don’t close the socket, and keep accepting connections.

s = TCPServer.new(3939)
while true
  conn = s.accept
  conn.print "Hi. What's your name? "
  # But if a second client connects to the server while the server is still waiting for the
  # first client’s input, the second client sees nothing—not even What's your name?—because the server is busy.
  name = conn.gets.chomp
  conn.puts "Hi, #{name}. Here's the date."
  conn.puts `date`
  conn.close
end
