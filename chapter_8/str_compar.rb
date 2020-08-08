puts "a" <=> "b" # -1
puts "b" <=> "a" # 1
puts "a" <=> "a" # 0
puts "b" > "a" # true
puts "a" > "A" # true
puts "." > "," # true

string = "Wellington Almeida Prado"
puts string.upcase # WELLINGTON ALMEIDA PRADO
puts string.downcase # wellington almeida prado
puts string.swapcase # wELLINGTON aLMEIDA pRADO
puts string.capitalize # Wellington almeida prado
puts string.rjust(string.size + 4, 'X') # XXXXWellington Almeida Prado
puts string.ljust(string.size + 4, 'X') # Wellington Almeida PradoXXXX


puts "The middle".center(20, "*") # *****The middle*****
puts "The middle".center(20, "*").size # 20

string2 = "   Iago Parrot   "
puts string2
puts string2.strip
puts string2.rstrip
puts string2.lstrip

puts "#########"

# By far the most common use of either chop or
# chomp is the use of chomp to remove newlines from the ends of strings
puts "Jafar".chop # Jafa
puts "Jafar\n".chomp # Jafar
puts "Jafar".chomp # Jafar
puts "Jafar".chomp('r') # Jafa
puts "Jafar".clear # nil

puts "#########"

puts string = "(to be named later)" # (to be named later)
puts string.replace("Almeida") # Almeida

puts "Iago Parrot".delete("abc") # Igo Prrot
puts "Iago Parrot".delete("^abc") # aa
puts "Iago Parrot".delete("a-e","^c") # Igo Prrot

puts "#########"

# Another specialized string transformation is crypt, which performs a
# Data Encryption Standard (DES) encryption on the string, similar to the
# Unix crypt(3) library function. The single argument to crypt is a two-character salt string
puts "Salted Man".crypt("34") # 34DcMMCRWnSUg

puts "#########"

puts "a".succ # b
puts "abc".succ # abd
puts "azz".succ # baa
