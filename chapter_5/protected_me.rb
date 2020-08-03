class C
  def initialize(n)
    @n = n
  end

  def n
    @n
  end

  def compare(c)
    if c.n > n
      puts "The other object's n is bigger."
    else
      puts "The other object's n is the same or smaller."
    end
  end

  # A protected method is thus like a private method, but with an exemption for
  # cases where the class of self (c1) and the class of the object having the
  # method called on it (c2) are the same or related by inheritance
  protected :n
end

c1 = C.new(100)
c2 = C.new(101)
c1.compare(c2)

