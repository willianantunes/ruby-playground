string = "Ruby is a cool language."
# To retrieve the nth character in a string, you use the [] operator/method,
# giving it the index, on a zero-origin basis, for the character you want.
# Negative numbers index from the end of the string
puts string[5] # i
puts string[-12] # o
puts string[15] # l
puts string[-1] # .

puts string[5, 10] # is a cool

# n..m as all the values between n and m, inclusive (or exclusive of m, if you use three dots instead of two, n...m)
puts string[7...14] # a cool
puts string[-12..-3] # ol languag
puts string[-12..20] # ol langua
puts string[15...-1] # language

# You can also grab substrings based on an explicit substring search.
# If the substring is found, it’s returned; if not, the return value is nil
puts string["cool lang"] # cool lang
puts string["very cool lang"] # nil

# It’s also possible to search for a pattern match using the [] technique with a regular expression
puts string[/c[ol ]+/] # cool l

# The [] method is also available under the name slice

puts string.slice!("cool ") # cool
puts string # Ruby is a language.

puts "###############"

string = "Ruby is a cool language."
string["cool"] = "great"
puts string # Ruby is a great language.
string[-1] = "!"
puts string # Ruby is a great language!
string[-9..-1] = "thing to learn!"
puts string # Ruby is a great thing to learn!

puts "###############"

# The string you get back from + is always a new string
puts "a" + "b" # ab
puts "a" + "b" + "c" # abc

# The expression str + "there." (which is syntactic sugar for the method call str.+ ("there"))
# evaluates to the new string "Hi there."
str = "Hi "
str = str + "there."
puts str

# To add (append) a second string permanently to an existing string, use the << method
str = "Hi "
str << "there."
puts str

str = "Hi "
puts "#{str}there."


puts "My name is #{
class Person
  attr_accessor :name
end

d = Person.new
d.name = "David"
d.name
}."
