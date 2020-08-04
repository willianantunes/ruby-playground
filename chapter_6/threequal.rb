class Ticket
  attr_accessor :venue, :date

  def initialize(venue, date)
    self.venue = venue
    self.date = date
  end

  def ===(other_ticket)
    self.venue == other_ticket.venue
  end
end

ticket1 = Ticket.new("Town Hall", "07/08/18")
ticket2 = Ticket.new("Conference Center", "07/08/18")
ticket3 = Ticket.new("Town Hall", "08/09/18")

puts "ticket1 is for an event at: #{ticket1.venue}."
case ticket1
when ticket2
  puts "Same location as ticket2!"
when ticket3
  puts "Same location as ticket3!"
else
  puts "No match."
end

# ticket1 is for an event at: Town Hall.
# Same location as ticket3!

user = Object.new

def user.first_name
  "David"
end

def user.last_name
  "Black"
end


puts case
     when user.first_name == "David", user.last_name == "Black"
       "You might be David Black."
     when Time.now.wday == 5
       "You're not David Black, but at least it's Friday!"
     else
       "You're not David Black, and it's not Friday."
     end
