class C
  def talk
    puts "Hi!"
  end
end

c = C.new
# Calling instance methods
c.talk

obj = Object.new

# Define singleton methods directly on individual objects
def obj.talk
  puts "Hi!"
end

obj.talk

class Car
  # And you’ve also seen that the most common type of singleton method is the
  # class method—a method added to a Class object on an individual basis
  def self.makes
    %w{ Honda Ford Toyota Chevrolet Volvo }
  end
end

class C
  # method and constant definitions here
end

# The << object notation means the anonymous, singleton class of object.
# When you’re inside the singleton class–definition body, you can define methods and
# these methods will be singleton methods of the object whose singleton class you’re in
begin
  class << object
    # method and constant definitions here
  end
rescue => e
  puts "I used object just to show you that any object can be put there"
end
str = "I am a string"

# The << object notation is the way the concept “singleton class of object” is expressed when class requires it
class << str
  def twice
    self + " " + self
  end
end

puts str.twice # I am a string I am a string

str1 = "I am a string"
begin
  str1.twice
rescue => e
  puts "Now you can't call it because it's another object! Error details: #{e.message}"
end

class Ticket
  class << self
    # This code results in the creation of the class method Ticket.most_expensive
    def most_expensive(*tickets)
      # The same class method could also be defined like this
      # (assuming this code comes at a point in the program where the Ticket class already exists)
      # class << Ticket
      tickets.max_by(&:price)
    end
  end
end
