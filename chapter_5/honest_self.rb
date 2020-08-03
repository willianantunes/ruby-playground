puts "Top level"
puts "self is #{self}"

class C
  puts "Class definition block"
  puts "self is #{self}"

  def self.x
    puts "Class method C.x:"
    puts "self is #{self}"
  end

  def m
    puts "Instance method C#m:"
    puts "self is #{self}"
  end
end

C.x
c_instance = C.new
c_instance.m

# Top level
# self is main
# Class definition block
# self is C
# Class method C.x:
# self is C
# Instance method C#m:
# self is #<C:0x00007fc9ea871340>

class C2
  puts "Just started class C2:"
  puts self
  module M2
    puts "Nested module C2::M2:"
    puts self
  end
  puts "Back in the outer level of C2:"
  puts self
end

# Just started class C2:
# C2
# Nested module C2::M2:
# C2::M2
# Back in the outer level of C2:
# C2

obj = Object.new

def obj.show_me
  puts "Inside singleton method show_me of #{self}"
end

obj.show_me
puts "Back from call to show_me by #{obj}"

# Inside singleton method show_me of #<Object:0x00007f9c798b0278>
# Back from call to show_me by #<Object:0x00007f9c798b0278>

class C3
  # class << self instructs the class that the following methods
  # will be class methods. Notice the end keyword that declares
  # the end of the class-definition grouping.
  class << self
    def x
      # definition of x
    end

    def y
      # definition of y
    end
  end
end

class C4
  def C4.no_dot
    puts "As long as self is C, you can call this method with no dot"
  end

  no_dot
end

C4.no_dot

# As long as self is C, you can call this method with no dot
# As long as self is C, you can call this method with no dot

class C5
  def x
    puts "This is method 'x'"
  end

  def y
    puts "This is method 'y', about to call x without a dot."
    x
  end
end

c = C5.new
c.y

# This is method 'y', about to call x without a dot.
# This is method 'x'

class Person
  attr_accessor :first_name, :middle_name, :last_name

  def whole_name
    n = first_name + " "
    n << "#{middle_name} " if middle_name
    n << last_name
  end
end

david = Person.new
david.first_name = "David"
david.last_name = "Black"
puts "David's whole name: #{david.whole_name}"
david.middle_name = "Alan"
puts "David's new whole name: #{david.whole_name}"

# David's whole name: David Black
# David's new whole name: David Alan Black

