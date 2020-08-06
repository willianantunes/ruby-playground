a = Object.new
b = Object.new

p a == a # true
p a == b # false
p a != b # true
p a.eql?(a) # true
p a.eql?(b) # false
p a.equal?(a) # true
p a.equal?(b) # false

p 5 == 5.0 # true
p 5.eql? 5.0 # false

# The most commonly redefined equality-test method, and the one you’ll see used most often, is ==

# If you want objects of class MyClass to have the full suite of
# comparison methods, all you have to do is the following
# 1. Mix a module called Comparable (which comes with Ruby) into MyClass.
# 2. Define a comparison method with the name <=> as an instance method in MyClass.
# The comparison method <=> (usually called the spaceship operator or spaceship method) is the heart of the matter

class Bid
  include Comparable
  attr_accessor :estimate

  def <=>(other_bid)
    if self.estimate < other_bid.estimate
      -1
    elsif self.estimate > other_bid.estimate
      1
    else
      0
    end
  end

  # You can shorten this method. Bid estimates are either floating-point numbers or integers
  # Numbers already know how to compare themselves to each other
  def <=>(other_bid)
    self.estimate <=> other_bid.estimate
  end
end

bid1 = Bid.new
bid2 = Bid.new
bid1.estimate = 100
bid2.estimate = 105
# The < method (along with >, >=, <=, ==, !=, and between?) is defined in
# terms of <=>, inside the Comparable module. (b.between?(a,c) tells you whether b > a and b < c.)
puts "Looking what it gives: #{bid1 < bid2}"
