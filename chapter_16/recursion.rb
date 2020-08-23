def fibonacci(x)
  y = 0
  z = 1

  x.times do
    temp = y
    y = z
    z = temp + y
  end

  y
end

p fibonacci(7) # 13


def fibonacci_2(x)
  x <= 1 ? x : fibonacci(x - 1) + fibonacci(x - 2)
end

p fibonacci_2(7) # 13

def sum_squares(x)
  if x == 0
    0
  else
    x ** 2 + sum_squares(x - 1)
  end
end

p sum_squares(3) # 14
