class Ticket
  def event
    "Can't really be specified yet..."
  end
end

puts Ticket.class.name

ticket = Ticket.new
puts ticket.event

class C
  def m
    puts "First definition of method m"
  end
  def m
    puts "Second definition of method m"
  end
end

puts C.new.m

