class Person
  def initialize
    puts "Creating a new Person!"
  end

  def set_name(string)
    puts "Setting person's name..."
    @name = string
  end

  def get_name
    puts "Returning the person's name..."
    @name
  end
end

joe = Person.new
joe.set_name("Joe")
puts joe.get_name


class Tickett
  def initialize(venue, date)
    @venue = venue
    @date = date
    @price = 15
  end

  def venue
    @venue
  end

  def date
    @date
  end

  def price
    @price
  end

  def discount(percent)
    @price = @price * (100 - percent) / 100.0
  end
end

t1 = Tickett.new("Paulista", Time.new)
p t1 # <Tickett:0x00007fbe97050db8 @venue="Paulista", @date=2020-08-01 15:06:55 -0300>
p t1.venue
p t1.date

th = Tickett.new("Town Hall", "2013-11-12")
cc = Tickett.new("Convention Center", "2014-12-13")
puts "We've created two tickets."
puts "The first is for a #{th.venue} event on #{th.date}."
puts "The second is for an event on #{cc.date} at #{cc.venue}."

puts th.price
th.discount(5)
puts th.price


class Tickettt
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def set_price(amount)
    @price = amount
  end

  def price
    @price
  end
end

ticket = Tickettt.new("Town Hall", "2013-11-12")
ticket.set_price(63.00)
puts "The ticket costs $#{"%.2f" % ticket.price}."
ticket.set_price(72.50)
puts "Whoops -- it just went up. It now costs $#{"%.2f" % ticket.price}."


class ImprovedTicket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def price=(amount)
    @price = amount
  end

  def price
    @price
  end
end

ticket_1 = ImprovedTicket.new("Town Hall", "2013-11-12")
ticket_1.price = 63.00
puts ticket_1.price