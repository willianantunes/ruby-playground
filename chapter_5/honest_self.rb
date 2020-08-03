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