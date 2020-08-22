# Networked rock/paper/scissors (RPS) game, but threadless
# See listing 14.4. RPS game logic embodied in Games::RPS class

module Games
  class RPS
    include Comparable
    WINS = [%w{ rock scissors },
            %w{ scissors paper },
            %w{ paper rock }]
    attr_accessor :move

    def initialize(move)
      @move = move.to_s
    end

    def <=>(other)
      if move == other.move
        0
      elsif WINS.include?([move, other.move])
        1
      elsif WINS.include?([other.move, move])
        -1
      else
        raise ArgumentError, "Something's wrong"
      end
    end

    def play(other)
      if self > other
        self
      elsif other > self
        other
      else
        false
      end
    end
  end
end

# Networked RPS program
# It waits for two people to join, gets their moves, reports the result, and exits.
# Not glitzy—but a good way to see how thread keys might help you.
# Just issue "telnet localhost 3939" on two terminals

require 'socket'
require_relative 'rps'

s = TCPServer.new(3939)
threads = []
2.times do |n|
  conn = s.accept
  threads << Thread.new(conn) do |c|
    Thread.current[:number] = n + 1
    Thread.current[:player] = c
    c.puts "Welcome, player #{n + 1}!"
    c.print "Your move? (rock, paper, scissors) "
    Thread.current[:move] = c.gets.chomp
    c.puts "Thanks... hang on."
  end
end
a, b = threads
a.join
b.join
rps1, rps2 = Games::RPS.new(a.fetch(:move, "error")),
    Games::RPS.new(b.fetch(:move, "error"))
winner = rps1.play(rps2)
if winner
  result = winner.move
else
  result = "TIE!"
end
threads.each do |t|
  t[:player].puts "The winner is #{result}!"
end
s.close


