# But this line of code runs forever. The select operation never finishes, so the chained-on
# first command never gets executed.
# (1..Float::INFINITY).select {|n| n % 3 == 0 }.first(10)

# Calling the lazy method directly on a range object will produce a lazy enumerator over that range.
# Since we’re now lazily enumerating, it’s possible to grab result sets from our operations without
# waiting for the completion of infinite tasks.
(1..Float::INFINITY).lazy.select { |n| n % 3 == 0 }
p (1..Float::INFINITY).lazy.select { |n| n % 3 == 0 }.first(10) # [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]

p my_enum = (1..Float::INFINITY).lazy.select { |n| n % 3 == 0 } # #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:select>
p my_enum.take(5).force # [3, 6, 9, 12, 15]
p my_enum.take(10).force # [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]

def fb_calc(i)
  case 0
  when i % 15
    "FizzBuzz"
  when i % 3
    "Fizz"
  when i % 5
    "Buzz"
  else
    i.to_s
  end
end

def fb(n)
  (1..Float::INFINITY).lazy.map { |i| fb_calc(i) }.first(n)
end


p fb(15) # ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
