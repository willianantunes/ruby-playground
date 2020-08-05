array = [1, 2, 3, 4, 5]
array.each { |e| puts "The block just got handed #{e}." }

# The block just got handed 1.
# The block just got handed 2.
# The block just got handed 3.
# The block just got handed 4.
# The block just got handed 5.

class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end
end


array = [10, 5, 25, 69, 4]
array.my_each { |e| puts "MY The block just got handed #{e}." }

# MY The block just got handed 10.
# MY The block just got handed 5.
# MY The block just got handed 25.
# MY The block just got handed 69.
# MY The block just got handed 4.
