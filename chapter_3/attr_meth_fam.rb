class RefactoredTicket
  attr_reader :price, :venue, :date

  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def price=(price)
    @price = price
  end
end

ticket = RefactoredTicket.new "Sample Venue", Time.new
puts ticket