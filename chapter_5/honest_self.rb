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