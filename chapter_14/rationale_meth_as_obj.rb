class A
  def a_method
    puts "Definition in class A"
  end
end

class B < A
  def a_method
    puts "Definition in class B (subclass of A)"
  end
end

class C < B
end

c = C.new
c.a_method # Definition in class B (subclass of A)
A.instance_method(:a_method).bind(c).call # Definition in class A

class C
  def call_original
    A.instance_method(:a_method).bind(self).call
  end
end

c.call_original # Definition in class A
