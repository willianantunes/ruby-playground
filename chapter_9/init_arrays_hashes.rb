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

