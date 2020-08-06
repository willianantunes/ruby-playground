# Listing an object’s methods
p "I am a String object".methods
p "I am a String object".methods.sort
p String.methods.sort


str = "A plain old string"

def str.shout
  self.upcase + "!!!"
end

puts str.methods.sort.include? :shout # true

p String.instance_methods.sort
p Enumerable.instance_methods.sort
# You can view a class’s instance methods without those of the class’s ancestors
# by using the slightly arcane technique
p String.instance_methods(false).sort

puts "########################"

obj = 1

puts "-- Examining objects at the instance level"
p obj.private_methods
p obj.public_methods
p obj.protected_methods
p obj.singleton_methods
puts "-- Examining objects at the instance level"
p Time.private_instance_methods
p Time.protected_instance_methods
p Time.public_instance_methods
