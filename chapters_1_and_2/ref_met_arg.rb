def change_string(str)
  str.replace("New string content!")
end


a1 = "Original string content!"
puts change_string(a1)
puts a1

b1 = "Original string content!"
puts change_string(b1.dup)
puts b1

b2 = "Original string content!"
puts change_string(b2.clone)
puts b2

# c1 = "Original string content!"
# c1.freeze
# change_string(c1)


