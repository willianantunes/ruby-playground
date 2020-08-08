string = "Ruby is indeed an interesting language to learn"

puts string.include?("Ruby") # true
puts string.include?("English") # false

puts string.start_with?("Ruby") # true
puts string.start_with?("ruby") # false

puts string.start_with?(/[A-Z]/) # true

puts string.empty? # false
puts "".empty? # true

# The size and length methods (they’re synonyms for the same method)
# do what their names suggest they do
puts string.size # 47
puts string.length # 47

puts string.count("a") # 4 times
# To count how many of a range of letters there are, you can use a hyphen-separated range
puts string.count("g-m") # 9 times
# Character specifications are case sensitive
puts string.count("A-Z") # Once

# You can also provide a written-out set of characters you want to count
puts string.count("aey. ") # 18

# To negate the search—that is, to count the number of characters
# that don’t match the ones you specify—put a ^ (caret) at the beginning of your specification
puts string.count("^aey. ") # 29
puts string.count("^g-m") # 38
puts string.count("g-m") # 9
puts string.count("^g-m") + string.count("g-m") == string.size # true

puts string.count("ag-m") # 13
puts string.count("ag-m", "^l") # 11

puts "########################"

puts string.index("indeed") # 8
puts string[8..string.index(" an")] # indeed
puts string.index("l") # 30
puts string.rindex("l") # 42

puts "########################"

# Although strings are made up of characters, Ruby has no separate
# character class. One-character strings can tell you their ordinal code, courtesy of the ord method
puts "a".ord # 97
puts 97.chr # a

