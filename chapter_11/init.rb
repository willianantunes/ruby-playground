# Regular expressions are instances of the Regexp class, which is one of the Ruby classes
# that has a literal constructor for easy instantiation.
# The regexp literal constructor is a pair of forward slashes
p //.class # Regexp
# Another common way of representing regular expressions is with %r{}
p %r{}.class # Regexp


p /abc/.match?("The alphabet starts with abc.") # true
p "The alphabet starts with abc.".match?(/abc/) # true

# Ruby also features a pattern-matching operator, =~ (equal sign and tilde). =~ goes between a string and a regexp:
puts "Match!" if /abc/ =~ "The alphabet starts with abc."
puts "Match!" if "The alphabet starts with abc." =~ /abc/

# The creation of a MatchData object means that a match was found
p /abc/.match("The alphabet starts with abc.") # #<MatchData "abc">
p /abc/.match("def") # nil

# =~ returns the numerical index of the character in the string where the match started
p "The alphabet starts with abc" =~ /abc/ # 25

# Notably, when using the %r{} syntax, you don’t need to escape the / character.
# Thus, the following two expressions are equivalent
p /\/home\/jleo3/ # /\/home\/jleo3/
p %r{/home/jleo3} # /\/home\/jleo3/

p /[A-Za-z]+,[A-Za-z]+,Mrs?\./.match("Peel,Emma,Mrs.,talented amateur") # #<MatchData "Peel,Emma,Mrs.">
# Now, when we perform the following match
p /([A-Za-z]+),[A-Za-z]+,(Mrs?\.)/.match("Peel,Emma,Mrs.,talented amateur") # #<MatchData "Peel,Emma,Mrs." 1:"Peel" 2:"Mrs.">
# Two things happen:
# - We get a MatchData object that gives us access to the submatches (discussed in a moment).
# - Ruby automatically populates a series of variables for us, which also give us access to those submatches.
puts $1 # Peel
puts $2 # Mrs.
p $3 # nil

/([A-Za-z]+),[A-Za-z]+,(Mrs?\.)/.match("Peel,Emma,Mrs.,talented amateur") #<MatchData "Peel,Emma,Mrs." 1:"Peel" 2:"Mrs.">
puts "Dear #{$2} #{$1}," # Dear Mrs. Peel,


def querying_result_matchdata_object
  string = "My phone number is (123) 555-1234."
  phone_re = %r{\((\d{3})\)\s+(\d{3})-(\d{4})}
  m = phone_re.match(string)
  unless m
    puts "There was no match—sorry."
    exit
  end
  print "The whole string we started with: "
  puts m.string
  print "The entire part of the string that matched: "
  puts m[0]
  puts "The three captures: "
  3.times do |index|
    puts "Capture ##{index + 1}: #{m.captures[index]}"
  end
  puts "Here's another way to get at the first capture:"
  print "Capture #1: "
  puts m[1]

  p m[1] == m.captures[0]
  p m[2] == m.captures[1]

  # The whole string we started with: My phone number is (123) 555-1234.
  # The entire part of the string that matched: (123) 555-1234
  # The three captures:
  # Capture #1: 123
  # Capture #2: 555
  # Capture #3: 1234
  # Here's another way to get at the first capture:
  # Capture #1: 123
  # true
  # true
end

querying_result_matchdata_object


p /abc/.inspect # "/abc/"
str = "Leopold Auer was the teacher of Jascha Heifetz."
p violinists = str.scan(/([A-Z]\w+)\s+([A-Z]\w+)/) # [["Leopold", "Auer"], ["Jascha", "Heifetz"]]
violinists.each do |fname, lname|
  puts "#{lname}'s first name was #{fname}."
  # Auer's first name was Leopold.
  # Heifetz's first name was Jascha.
end

str.scan(/([A-Z]\w+)\s+([A-Z]\w+)/) do |fname, lname|
  puts "#{lname}'s first name was #{fname}."
  # Auer's first name was Leopold.
  # Heifetz's first name was Jascha.
end

p "Ruby".split(//) # ["R", "u", "b", "y"]
line = "first_name=david;last_name=black;country=usa"
p record = line.split(/=|;/) # ["first_name", "david", "last_name", "black", "country", "usa"]
data = []
record = Hash[*line.split(/=|;/)]
data.push(record) # [{"first_name"=>"david", "last_name"=>"black", "country"=>"usa"}]
p data

# You can provide a second argument to split; this argument limits the number of items returned. In this example
"a,b,c,d,e".split(/,/, 3) # ["a", "b", "c,d,e"]

p ["USA", "UK", "France", "Germany"].grep(/[a-z]/) # ["France", "Germany"]
p ["USA", "UK", "France", "Germany"].select { |c| /[a-z]/ === c } # ["France", "Germany"]
p ["USA", "UK", "France", "Germany"].grep(/[a-z]/) { |c| c.upcase } # ["FRANCE", "GERMANY"]
# There’s no automatic conversion between numbers and strings
# You get back an empty array; the array has no string element that matches the
# regexp /1/, no element for which it’s true that /1/ === element.
p [1, 2, 3].grep(/1/) # []
