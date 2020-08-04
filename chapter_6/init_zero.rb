x = 11

if x > 10 then puts x end
if x > 10; puts x; end


def print_conditionally
  print "Enter an integer: "
  n = gets.to_i
  if n > 0
    puts "Your number is positive."
  elsif n < 0
    puts "Your number is negative."
  else
    puts "Your number is zero."
  end
end

print_conditionally

if nil; puts "Ain't gonna happen."; end

# if not (x == 1)
# if !(x == 1)
# unless x == 1

unless x > 100
  puts "Small number!"
else
  puts "Big number!"
end

if x > 50
  if x > 100
    puts "Big number"
  else
    puts "Medium number"
  end
end

puts "Big number!" if x > 100


name = "David A. Black"
if m = /la/.match(name)
  puts "Found a match!"
  print "Here's the unmatched start of the string: "
  puts m.pre_match
  print "Here's the unmatched end of the string: "
  puts m.post_match
else
  puts "No match"
end

# Here's the unmatched start of the string: David A. B
# Here's the unmatched end of the string: ck

