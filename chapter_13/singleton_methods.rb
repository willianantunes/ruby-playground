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

class Person
  attr_accessor :name
end

david = Person.new
david.name = "David"
joe = Person.new
joe.name = "Joe"
ruby = Person.new
ruby.name = "Ruby"

# Now let’s say that some persons—that is, some Person objects—don’t like to reveal their names.
# A logical way to add this kind of secrecy to individual objects is to add a singleton version
# of the name method to each of those objects
def david.name
  "[not available]"
end

# https://stackoverflow.com/a/10782889/3899136
define_singleton_method(:call_their_names) do
  puts "We've got one person named #{joe.name}, "
  puts "one named #{david.name},"
  puts "and one named #{ruby.name}."
end

call_their_names

# We've got one person named Joe,
# one named [not available],
# and one named Ruby.

# So far, so good. But what if more than one person decides to be secretive?
# It would be a nuisance to have to write def person.name... for every such person

module Secretive
  def name
    "[not available]"
  end
end

class << ruby
  include Secretive
end

call_their_names


class C
  def talk
    puts "Hi from original class!"
  end
end

module M
  def talk
    puts "Hello from module!"
  end
end

c = C.new
c.talk

class << c
  include M
  # You can see this graphically by using the ancestors method,
  # which gives you a list of the classes and modules in the inheritance
  # and inclusion hierarchy of any class or module
  p ancestors # [#<Class:#<C:0x00007f8dea133218>>, M, C, Object, Kernel, BasicObject]
end

c.talk

# Hi from original class!
# Hello from module!

string = "a string"
p string.class.ancestors # [String, Comparable, Object, Kernel, BasicObject]
p string.singleton_class.ancestors # [#<Class:#<String:0x00007f996a042cd8>>, String, Comparable, Object, Kernel, BasicObject]

class C
end

def C.a_class_method
  puts "Singleton method defined on C"
end

C.a_class_method # Singleton method defined on C

class D < C
end

D.a_class_method # Singleton method defined on C


