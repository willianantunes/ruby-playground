# This:
x = 1 + 2
# Is the same as:
x = 1.+(2)

obj = Object.new

# The plus sign in the puts statement is a call to the + method of obj, with the
# integer 100 as the single (ignored) argument.
def obj.+(other_obj)
  "Trying to add something to me, eh?"
end

puts obj + 100

class Account
  attr_accessor :balance

  def initialize(amount = 0)
    self.balance = amount
  end

  def +(x)
    self.balance += x
  end

  def -(x)
    self.balance -= x
  end

  def to_s
    balance.to_s
  end
end

acc = Account.new(20)
puts "Current value: #{acc}"
acc -= 5
puts "Current value: #{acc}"

class Banner
  def initialize(text)
    @text = text
  end

  def to_s
    @text
  end

  def +@
    @text.upcase
  end

  def -@
    @text.downcase
  end
end


banner = Banner.new("Eat at Joe's!")
puts banner
puts +banner
puts -banner

class Banner
  def !
    @text.reverse
  end
end

puts !banner
# We’ll need to use parentheses around the not version to clarify
# the precedence of expressions (otherwise, puts thinks we’re trying to print not):
puts (not banner)


