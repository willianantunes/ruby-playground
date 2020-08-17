# 1. The most common category of changes to built-in Ruby classes is the ADDITIVE CHANGE:
# adding a method that doesn’t exist. Sample project: Active Support

# 2. A PASS-THROUGH method change involves overriding an existing method in such a way
# that the original version of the method ends up getting called along with the new version

# You can use pass-through overrides for a number of purposes, including logging and debugging:

class String
  alias :__old_reverse__ :reverse

  def reverse
    $stderr.puts "Reversing a string!"
    __old_reverse__
  end
end

puts "David".reverse

# 3. An ADDITIVE/PASS-THROUGH HYBRID is a method that has the same name as
# an existing core method, calls the old version of the method (so it’s not an out-and-out replacement),
# and adds something to the method’s interface.

# 4. Per-object changes with extend

module GsubBangModifier
  def gsub!(*args, &block)
    super || self
  end
end

str = "Hello there!"
# This way you can change the behavior of core objects—strings, arrays, hashes,
# and so forth—without reopening their classes and without introducing changes on a global level.
str.extend(GsubBangModifier)
str.gsub!(/zzz/, "abc").reverse!
puts str

# 4.1 Refinements... The idea of a refinement is to make a temporary, limited-scope change
# to a class (which can, though needn't, be a core class).

module Shout
  # Refinements can help you make temporary changes to core classes in a relatively safe way
  refine String do
    def shout
      self.upcase + "!!!"
    end
  end
end

class Person
  attr_accessor :name
  # The using method flips the switch: once you “use” the module in which you’ve defined
  # the refinement you want, the target class adopts the new behaviors
  using Shout

  def announce
    puts "Announcing #{name.shout}"
  end
end

david = Person.new
david.name = "David"
david.announce
