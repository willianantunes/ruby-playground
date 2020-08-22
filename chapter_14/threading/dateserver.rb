require 'socket'

# After you run this code, type "telnet localhost 3939" on you terminal
s = TCPServer.new(3939)
conn = s.accept
conn.puts "Hi. Here's the date."
conn.puts `date`
conn.close
s.close
