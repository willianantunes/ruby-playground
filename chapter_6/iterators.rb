def my_loop
  while true
    yield
  end
end

# Shorter version

def my_loop
  yield while true
end


array = [1,2,3]
p array
# The map method works through an array one item at a time, calling the code
# block once for each item and creating a new array consisting of the results
# of all of those calls to the block
array.map {|n| n * 10 } # it's interprete like this: puts(array.map {|n| n * 10 })
p array
array.map do |n| n * 10 end
p array
p array.map {|n| n * 10 }
p array
# The do/end version returns an enumerator. Sample: <Enumerator:0x00007fdd208b8cb0>
puts array.map do |n| n * 10 end # it's interpreted like this: puts(array.map) do |n| n * 10 end
p array



p 5.times # it returns <Enumerator: 5:times>
p 5.times { puts "Writing this 5 times!" }
p 5.times { |i| puts "I'm on iteration" }

class Integer
  def my_times
    c = 0
    puts "c = 0"
    puts "until c == #{self}..."
    until c == self
      yield c
      c += 1
    end
    self
  end
end

ret = 5.my_times {|i| puts "CUSTOM I'm on iteration #{i}!" }
puts ret

