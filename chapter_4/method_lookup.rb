module M
  def report
    puts "'report' method in module M"
  end
end

class C
  include M
end

class D < C
end

obj = D.new
obj.report


module InterestBearing
  def calculate_interest
    puts "Placeholder! We're in module InterestBearing."
  end
end

class BankAccount
  include InterestBearing

  def calculate_interest
    puts "Placeholder! We're in class BankAccount."
    puts "And we're overriding the calculate_interest method..."
    puts "which was defined in the InterestBearing module."
  end
end

account = BankAccount.new
account.calculate_interest

module P
  def report
    puts "'report' method in module P"
  end
end
module Q
  def report
    puts "'report' method in module Q"
  end
end

class R
  include P
  include Q
end

c = R.new
c.report