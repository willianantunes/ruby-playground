names = ["David", "Alan", "Black"]
p names.map { |name| name.upcase } # it creates a new guy instead of alter the "names" one

class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end

  def my_map
    acc = []
    my_each { |e| acc << yield(e) }
    acc
  end
end

# Block parameters are surrounded by pipes, rather than parentheses as method parameters are
p names.my_map { |name| name.upcase }


def args_unleashed(a, b = 1, *c, d, e)
  puts "Arguments:"
  p a, b, c, d, e
end

def block_args_unleashed
  yield(1, 2, 3, 4, 5)
end

block_args_unleashed do |a, b = 1, *c, d, e|
  puts "Arguments:"
  print a, b, c, d, e
  # Arguments:
  # 12[3]45
end

