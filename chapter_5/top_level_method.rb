def talk
  puts "Hello"
end

puts "Trying 'talk' with no receiver..."
talk
puts "Trying 'talk' with an explicit receiver..."
obj = Object.new
# obj.talk # private method `talk' called for #<Object:0x00007fb04e889ae0> (NoMethodError)

p Kernel.private_instance_methods.sort
