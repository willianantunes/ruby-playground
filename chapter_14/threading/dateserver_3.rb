require 'socket'

# After you run this code, type "telnet localhost 3939" on you terminal
# What if you want the server to field multiple requests?
# Easy: don’t close the socket, and keep accepting connections.

s = TCPServer.new(3939)
while (conn = s.accept)
  # The threading prevents the entire application from blocking while it waits for a single client to provide input
  Thread.new(conn) do |c|
    c.print "Hi. What's your name? "
    name = c.gets.chomp
    c.puts "Hi, #{name}. Here's the date."
    c.puts `date`
    c.close
  end
end




