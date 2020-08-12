str = "abcde"
str.each_byte { |b| p b }

# 97
# 98
# 99
# 100
# 101

str.each_char { |c| p c }

# "a"
# "b"
# "c"
# "d"
# "e"

str = "100\u20ac" # "100€"
str.each_codepoint { |cp| p cp }

# 49
# 48
# 48
# 8364

str.each_byte { |b| p b }

# Due to the encoding, the number of bytes is greater than the number of code points
# (or the number of characters, which in this case is equal to the number of code points).
# 49
# 48
# 48
# 226
# 130
# 172

str = "This string\nhas three\nlines"
str.each_line { |l| puts "Next line: #{l}" }

# Next line: This string
# Next line: has three
# Next line: lines

str = "IGU!Kubo!Prates"
$/ = "!"
str.each_line { |l| puts "Next line: #{l}" }
# Next line: IGU!
# Next line: Kubo!
# Next line: Prates

string = "Hello"
p string.bytes # [72, 101, 108, 108, 111]
