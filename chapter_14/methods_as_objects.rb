class C
  def talk
    puts "Method-grabbing test!  self is #{self}."
  end
end

c = C.new
meth = c.method(:talk)
p meth # #<Method: C#talk>
# owner is a useful method when debugging, especially when inheritance or mix-ins are present.
p meth.owner # C
meth.call # Method-grabbing test!  self is #<C:0x00007fe9d3121988>.

class D < C
end

d = D.new
# You can also unbind the method from its object and then bind it to another object,
# as long as that other object is of the same class as the original object
unbound = meth.unbind
unbound.bind(d).call # Method-grabbing test!  self is #<D:0x00007fdf3788d380>.

# This single line is equivalent to a method call plus an unbind call:
unbound = C.instance_method(:talk)
p unbound # #<UnboundMethod: C#talk>
