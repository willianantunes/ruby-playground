class C
  def x(value_for_a, recurse = false)
    a = value_for_a
    print "Here's the inspect-string for 'self': "
    p self
    print "And here's a: "
    puts a
    if recurse
      puts "Calling myself (recursion)..."
      x("Second value for a")
      print "Back after recursion; here's a: "
      puts a
    end
  end
end

c = C.new
c.x("First value for a", true)

# Here's the inspect-string for 'self': #<C:0x00007fe93905d488>
# And here's a: First value for a
# Calling myself (recursion)...
# Here's the inspect-string for 'self': #<C:0x00007fe93905d488>
# And here's a: Second value for a
# Back after recursion; here's a: First value for a
