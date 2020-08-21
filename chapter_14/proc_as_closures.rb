def talk
  a = "Hello"
  puts a # Hello
end

a = "Goodbye"
talk
puts a # Goodbye

def multiply_by(m)
  Proc.new { |x| puts x * m }
end

mult = multiply_by(10)
mult.call(12)


def call_some_proc(pr)
  a = "irrelevant 'a' in method scope"
  puts a
  pr.call
end

a = "'a' to be used in Proc block"
# A piece of code that carries its creation context around with it like this is called a closure
pr = Proc.new { puts a }
pr.call
call_some_proc(pr)

# 'a' to be used in Proc block
# irrelevant 'a' in method scope
# 'a' to be used in Proc block

def make_counter
  n = 0
  return Proc.new { n += 1 }
end

c = make_counter
puts c.call # 1
puts c.call # 2
d = make_counter
puts d.call # 1
puts c.call # 3

pr = Proc.new {|x| puts "Called with argument #{x}" }
pr.call(100) # Called with argument 100
