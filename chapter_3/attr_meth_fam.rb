class RefactoredTicket
  attr_reader :venue, :date
  attr_accessor :price

  def initialize(venue, date = nil, price: nil)
    @venue = venue
    @date = date
    @price = price
  end

  def self.most_expensive(*tickets)
    tickets.max_by(&:price)
  end
end

ticket = RefactoredTicket.new "Sample Venue", Time.new
ticket.price = 15.6
puts ticket.price

ti_1 = RefactoredTicket.new("1", price: 1)
ti_2 = RefactoredTicket.new("1", price: 7)
ti_3 = RefactoredTicket.new("1", price: 2)
result = RefactoredTicket.most_expensive(ti_1, ti_2, ti_3)
puts result.price

c = Class.new do
  def say_hello
    puts "Hello!"
  end
end

d = c.new
puts d.say_hello


p ["havoc", "prodigy"].map(&:capitalize) # ["Havoc", "Prodigy"]

th = RefactoredTicket.new("Town Hall","2013-11-12")
cc = RefactoredTicket.new("Convention Center","2014-12-13")
fg = RefactoredTicket.new("Fairgrounds", "2015-10-11")
th.price = 12.55
cc.price = 10.00
fg.price = 18.00
highest = RefactoredTicket.most_expensive(th,cc,fg)
puts "The highest-priced ticket is the one for #{highest.venue}."