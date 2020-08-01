class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end

  def Temperature.f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end


puts Temperature::c2f 30
puts Temperature.c2f 30

class AgainTicketMyFriend
  VENUES = ["Convention Center", "Fairgrounds", "Town Hall"]

  def initialize(venue, date)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}"
    end
    @date = date
  end
end


puts AgainTicketMyFriend::VENUES
# AgainTicketMyFriend.new("a", Time.new) # it raises Unknown venue a (ArgumentError)
AgainTicketMyFriend.new("Fairgrounds", Time.new)

puts Math::PI

module SomeModule
  module InnerModule
    class MyClass
      CONSTANT = 4
    end
  end
end

puts SomeModule::InnerModule::MyClass::CONSTANT # 4
#puts SomeModule::InnerModule::MyClass.CONSTANT # it does not work: undefined method `CONSTANT' for SomeModule::InnerModule::MyClass:Class (NoMethodError)
puts SomeModule::InnerModule::MyClass.constants # it returns CONSTANT