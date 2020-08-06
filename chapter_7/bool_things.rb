if (
class MyClass
end)
  puts "Empty class definition is true!"
else
  puts "Empty class definition is false!"
end
if (
class MyClass
  1;
end)
  puts "Class definition with the number 1 in it is true!"
else
  puts "Class definition with the number 1 in it is false!"
end
if (
def m
  return false;
end)
  puts "Method definition is true!"
else
  puts "Method definition is false!"
end
if "string"
  puts "Strings appear to be true!"
else
  puts "Strings appear to be false!"
end
if 100 > 50
  puts "100 is greater than 50!"
else
  puts "100 is not greater than 50!"
end

# Empty class definition is false!
# Class definition with the number 1 in it is true!
# Method definition is true!
# Strings appear to be true!
# 100 is greater than 50!

# Note in particular that zero and empty strings (as well as empty arrays and hashes)
# have a Boolean value of true. The only objects that have a Boolean value of false are false and nil.
puts true.class # TrueClass
puts false.class # FalseClass

# if you want a class to show you all of its instance methods but to
# exclude those defined in ancestral classes, you can provide
# the argument false to your request
p String.instance_methods(false)
