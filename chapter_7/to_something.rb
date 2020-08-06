p ["one", "two", "three", 4, 5, 6].to_s
p Object.new.to_s

obj = Object.new
# The object’s default string representation is the usual class and memory-location
puts obj

def obj.to_s
  "I'm an object!"
end

puts obj


# Born to be overridden: inspect
# By default—unless a given class overrides inspect—the inspect string is
# a mini-screen-dump of the object’s memory location
puts Object.new.inspect

class Person
  def initialize(name)
    @name = name
  end

  def inspect
    @name
  end
end

david = Person.new("David")
puts david.inspect


p (1..5)
p (1..5).to_a # to_a means to array

# For now, a Struct is a shorthand way for creating a class with read/write attributes
Computer = Struct.new(:os, :manufacturer)
laptop1 = Computer.new("linux", "Lenovo")
laptop2 = Computer.new("os x", "Apple")
p [laptop1, laptop2].map { |laptop| laptop.to_a } # it prints: [["linux", "Lenovo"], ["os x", "Apple"]]


array = [1, 2, 3, 4, 5]
print array # [1, 2, 3, 4, 5]
print *array # 12345
p [*array] # [1, 2, 3, 4, 5]
p [array] # [[1, 2, 3, 4, 5]]

def combine_names(first_name, last_name)
  first_name + " " + last_name
end

names = ["David", "Black"]
puts combine_names(*names)

####################################
# to_i and to_f

# They guy below does not work
begin
  1 + "2"
rescue
  puts "yeah, it does not work"
end

# this is too lax as it returns 123
"123abc".to_i
# But the guy below returns an error
begin
  # Stricter conversions with Integer
  Integer("123abc")
rescue => e
  puts "yep! an error: #{e.message}"
end


"123abc".to_f

begin
  # Stricter conversions with Float
  Float("123abc")
rescue => e
  puts "yep! an error: #{e.message}"
end

####################################
# to_s

class Person2
  attr_accessor :name

  def to_str
    name
  end
end

david = Person2.new
david.name = "David"
puts "david is named " + david + "."

####################################
# to_ary

class Person3
  attr_accessor :name, :age, :email

  def to_ary
    [name, age, email]
  end
end


david = Person3.new
david.name = "David"
david.age = 55
david.email = "david@wherever"
array = []
# Concatenating a Person object to an array has the effect of
# adding the name, age, and email values to the target array
array.concat(david)
p array # ["David", 55, "david@wherever"]

