p [3, 2, 5, 4, 1].sort # [1, 2, 3, 4, 5]

class Painting
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def to_s
    "My price is #{price}."
  end

  def <=>(other_painting)
    self.price <=> other_painting.price
  end
end

paintings = 5.times.map { Painting.new(rand(100..900)) }
puts "5 randomly generated Painting prices:"
puts paintings
puts "Same paintings, sorted:"
puts paintings.sort

# 5 randomly generated Painting prices:
# My price is 464.
# My price is 472.
# My price is 554.
# My price is 445.
# My price is 762.
# Same paintings, sorted:
# My price is 445.
# My price is 464.
# My price is 472.
# My price is 554.
# My price is 762.

# Like sort, sort_by is an instance method of Enumerable.
# The main difference is that sort_by always takes a block, and it only requires that you
# show it how to treat one item in the collection
p ["2", 1, 5, "3", 4, "6"].sort { |a, b| a.to_i <=> b.to_i } # [1, "2", "3", 4, 5, "6"]
p ["2", 1, 5, "3", 4, "6"].sort_by { |a| a.to_i } # [1, "2", "3", 4, 5, "6"]

# Our Painting class implemented <=> to achieve sorting within an array.
# But try to compare one painting to another on your own (outside of an array), and you’ll run into trouble:

pa1 = Painting.new(100)
pa2 = Painting.new(200)
begin
  p pa1 > pa2
rescue => e
  puts "Expected error: #{e.message}"
end

class Painting
  include Comparable
end

p pa1 > pa2 # false
p pa1 < pa2 # true
p pa3 = Painting.new(300)
p pa2.between?(pa1, pa3) # true

cheapest, priciest = [pa1, pa2, pa3].minmax
p Painting.new(1000).clamp(cheapest, priciest).object_id == priciest.object_id # true
