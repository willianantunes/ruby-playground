# Functional languages make use of lazy evaluation in order to work with very large,
# or even infinite, sets of data.

def find_multiples(num, mult)
  (1..Float::INFINITY).lazy.select { |x| x % mult == 0 }.first(num)
end

p find_multiples(3, 50) # [50, 100, 150]

p first_3_multiples = self.method(:find_multiples).curry.(3) # #<Proc:0x00007ffd958ef9c8 (lambda)>
p first_5_multiples = self.method(:find_multiples).curry.(5) # #<Proc:0x00007ffd958ef6d0 (lambda)>
p first_3_multiples.(256) # [256, 512, 768]

p squares = (1..Float::INFINITY).lazy.map { |x| x * x } # #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:map>

p squares.first(10) # [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
p squares.first(10)[3] # 16

def sum_factorial_powers(pfact, size)
  powers = -> (power) { (1..Float::INFINITY).lazy.map { |x| x ** power } }
  if pfact == 1
    Array.new(size) { |x| x + 1 }
  else
    [powers.call(pfact).first(size),
     sum_factorial_powers(pfact - 1, size)].
        flatten.sum
  end
end

p sum_factorial_powers(4, 3) # 154

