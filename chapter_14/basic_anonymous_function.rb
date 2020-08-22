pr = Proc.new { puts "Inside a Proc's block" }
pr.call

# The Kernel#proc method is an alias for Proc.new
pr = proc { puts "Inside a Proc's block" }
pr.call

# A method can capture a block, objectified into a proc, using the special parameter syntax
def call_a_proc(&block)
  block.call
end

call_a_proc { puts "I'm the block...or Proc...or something." }

# it’s also possible for a proc to serve in place of the code block in a method call, using a similar special syntax
my_proc = Proc.new { |x| puts x.upcase }
%w{ Willian Antunes }.each(&my_proc)

# An important and often misunderstood fact is that a Ruby code block is not an object.
# This familiar trivial example has a receiver, a dot operator, a method name, and a code block
p [1, 2, 3].each { |x| x * 10 } # [1, 2, 3]
# The receiver is an object, but the code block isn’t.
# Rather, the code block is part of the syntax of the method call

# Without a special flag like &, a Ruby method has no way of knowing that you want to stop
# binding parameters to regular arguments and instead perform a block-to-proc conversion and save the results
def capture_block(&block)
  puts "Got block as proc"
  block.call
end

capture_block { puts "Inside the block" }

# The & also makes an appearance when you want to do the conversion the other way:
# use a Proc object instead of a code block.
my_proc_2 = Proc.new { puts "yeah I've been called!" }
capture_block(&my_proc_2)

# Keep in mind that because the proc tagged with & is serving as the code block, you can’t send a
# code block in the same method call. If you do, you’ll get an error
# capture_block(&p) { puts "This is the explicit block" }

albums = {1988 => "Straight Outta Compton", 1993 => "Midnight Marauders",
          1996 => "The Score", 2004 => "Madvillainy",
          2015 => "To Pimp a Butterfly"}

p albums[2015] # "To Pimp a Butterfly"

p [1988, 1996].map(&albums) # ["Straight Outta Compton", "The Score"]
p (1990..1999).map(&albums).compact # ["Midnight Marauders", "The Score"]

# One is the square-brackets method/operator, which is a synonym for call.
# You place any arguments inside the brackets:
mult = lambda { |x, y| x * y }
p mult[3, 4] # 12

# You can also call callable objects using the () method:
p mult.(3,4) # 12
