
# As you’ve seen, include will make a module’s methods
# available as instance methods. extend, on the other hand, will make a module’s
# methods available as class methods

module Convertible
  def c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
  def f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

class Thermometer
  extend Convertible
end


Thermometer.c2f(35)
Thermometer.f2c(95)

p Thermometer.ancestors # [Thermometer, Object, Kernel, BasicObject]