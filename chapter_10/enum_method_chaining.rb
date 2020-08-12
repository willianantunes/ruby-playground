# Method chaining is a common technique in Ruby programming. It’s common in part because it’s so easy
animals = %w(Jaguar Turtle Lion Antelope)
puts animals.select { |n| n[0] < 'M' }.map(&:upcase).join(", ") # JAGUAR, LION, ANTELOPE

p animals.each_slice(2).map do |predator, prey|
  "Predator: #{predator}, Prey: #{prey}\n"
end # #<Enumerator: #<Enumerator: ["Jaguar", "Turtle", "Lion", "Antelope"]:each_slice(2)>:map>

p ('a'..'z').map.with_index { |letter, i| [letter, i] } # [["a", 0], ["b", 1], ["c", 2], ["d", 3], ..........


class String
  # The method takes one argument: the string that will be used as the basis of the XOR operation (the key) 1
  def ^(key)
    kenum = key.each_byte.cycle
    each_byte.map { |byte| byte ^ kenum.next }.pack("C*")
  end
end


str = "Nice little string."
key = "secret!"
p x = str ^ key # "=\f\x00\x17E\x18H\a\x11\x0F\x17E\aU\x01\f\r\x15K"
p orig = x ^ key # "Nice little string."
