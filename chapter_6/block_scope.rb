def block_scope_demo
  x = 100
  1.times do
    # it turns out that the variable inside the block is the same as the one that existed prior to the block
    x = 200
    puts x
  end
  puts x
end

block_scope_demo

# 200
# 200

def block_local_parameter
  x = 100
  # The x inside the block isn’t the same as the x outside the block, because x is used as a block parameter
  [1, 2, 3].each do |x|
    puts "Parameter x is #{x}"
    x = x + 10
    puts "Reassigned to x in block; it's now #{x}"
  end
  puts "Outer x is still #{x}"
end


block_local_parameter

# Parameter x is 1
# Reassigned to x in block; it's now 11
# Parameter x is 2
# Reassigned to x in block; it's now 12
# Parameter x is 3
# Reassigned to x in block; it's now 13
# Outer x is still 100


class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end

  def Temperature.now
    rand(0..100)
  end
end

celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
fahrenheit = Temperature.now
puts "The temperature is now: #{fahrenheit} degrees Fahrenheit."
puts "Celsius\tFahrenheit"
# If you wish to preserve the value of fahrenheit defined before the block, Ruby provides block-local variables
# celsius.each do |c;fahrenheit|
celsius.each do |c|
  fahrenheit = Temperature.c2f(c)
  puts "#{c}\t#{fahrenheit}"
end
puts fahrenheit

# The temperature is now: 19 degrees Fahrenheit.
# Celsius	Fahrenheit
# 0	32.0
# 10	50.0
# 20	68.0
# 30	86.0
# 40	104.0
# 50	122.0
# 60	140.0
# 70	158.0
# 80	176.0
# 90	194.0
# 100	212.0
# 212.0
