hash = {red: "ruby", white: "diamond", green: "emerald"}
# The parentheses in the block parameters (key,value) serve to split apart an array
hash.each_with_index { |(key, value), i|
  puts "Pair #{i} is: #{key}/#{value}"
}

# Pair 0 is: red/ruby
# Pair 1 is: white/diamond
# Pair 2 is: green/emerald

p Array.new(3) # [nil, nil, nil]
p Array.new(3, "abc") # ["abc", "abc", "abc"]

p Array.new(3) { |i| 10 * (i + 1) } # [10, 20, 30]

# That’s because the first and second positions in the array contain the
# same string object, not two different strings that happen to both
# consist of "abc". To create an array that inserts a different "abc" string
# into each slot, you should use Array.new(3) { "abc" }. The code block runs
# three times, each time generating a new string (same characters, different string object)
p a = Array.new(3, "abc") # ["abc", "abc", "abc"]
a[0] << "def"
p a # ["abcdef", "abcdef", "abcdef"]

p a = Array.new(3) { "abc" } # ["abc", "abc", "abc"]
a[0] << "def"
p a # ["abcdef", "abc", "abc"]

# The literal array constructor: [ ]
array_from_literal_constructor = []
p array_from_literal_constructor # []
array_from_literal_constructor = [1, 2, "three", 4, []]
p array_from_literal_constructor # [1, 2, "three", 4, []]


p string = "A string" # "A string"
p string.respond_to?(:to_ary) # false
p string.respond_to?(:to_a) # false
p Array(string) # ["A string"]

def string.to_a
  split(//)
end

p Array(string) # ["A", " ", "s", "t", "r", "i", "n", "g"]
# Ruby provides a %w operator (shorthand for “words”)
p %w(Joe Leo III) # ["Joe", "Leo", "III"]
p %w(David\ A.\ Black is a Rubyist.) # ["David A. Black", "is", "a", "Rubyist."]
# The strings in the list are parsed as single-quoted strings.
# But if you need double-quoted strings, you can use %W instead of %w
p %W(Joe is #{2018 - 1981} years old.) # ["Joe", "is", "37", "years", "old."]

puts "##############################"

# Just as you can create arrays of strings using %w and %W,
# you can also create arrays of symbols using %i and %I
p %i(a b c) # [:a, :b, :c]
d = "David"
p %I("#{d}") # [:"\"David\""]


obj = Object.new
p Array.try_convert(obj)

def obj.to_ary
  [1, 2, 3]
end

p Array.try_convert(obj)

def obj.to_ary
  "Not an array!"
end

begin
  Array.try_convert(obj)
rescue => e
  puts "Error: #{e.message}" # Error: can't convert Object to Array (Object#to_ary gives String)
end

puts "############################## Inserting, retrieving, and removing array elements"

# Any object you add to the array goes at the beginning, at the end, or somewhere in the middle.
# The most general technique for inserting one or more items into an array
# is the setter method []= (square brackets and equal sign)

a = []
a[0] = "first"
p a

a = [1,2,3,4,5]
p a[2] # 3
p a.[](2) # 3

p a = %w(red orange yellow purple gray indigo violet) # ["red", "orange", "yellow", "purple", "gray", "indigo", "violet"]
p a[3,2] # ["purple", "gray"]
a[3,2] = "iago", "jafar"
p a # ["red", "orange", "yellow", "iago", "jafar", "indigo", "violet"]


