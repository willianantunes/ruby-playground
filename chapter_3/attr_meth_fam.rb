class RefactoredTicket
  attr_reader :price, :venue, :date
  attr_writer :price

  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end

ticket = RefactoredTicket.new "Sample Venue", Time.new
ticket.price = 15.6
puts ticket.price