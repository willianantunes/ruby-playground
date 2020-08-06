# Destructive (receiver-changing) effects as danger
str = "Hello"
puts str
str.upcase
puts str
str.upcase!
puts str

# The bang doesn’t mean destructive; it means dangerous, possibly unexpected behavior.
