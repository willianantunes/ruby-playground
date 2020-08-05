# loop { puts "Looping forever!" }
# loop do
#   puts "Looping forever!"
# end


n = 0
loop do
  n = n + 1
  print "#{n} " # 1 2 3 4 5 6 7 8 9 10
  break if n > 9
end

n = 0
loop do
  n = n + 1
  print "#{n}"
  next unless n == 10
  break
end

puts

n = 1
while n < 11
  print n
  n = n + 1
end
puts "Done!"


n = 10
begin
  puts n
end while n < 10


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
# print_conditionally


class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
end
celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
puts "Celsius\tFahrenheit"
for c in celsius
  puts "#{c}\t#{Temperature.c2f(c)}"
end

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
