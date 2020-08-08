# Symbols are a hard nut to crack for many people learning Ruby

# Symbols are immutable. There’s no such thing as appending characters to a symbol;
# once the symbol exists, that’s it. You’ll never see :abc << :d or anything of that kind

# Symbols are unique. Whenever you see :xyz, you’re seeing a representation of the same object.
# Again, symbols are more like integers than strings in this respect
puts :a # a
puts :book # book
puts :"Here's how to make a symbol with spaces in it." # Here's how to make a symbol with spaces in it.
puts :book.to_s # book

puts "xyz".object_id # 70181657799840
puts "xyz".object_id # 70181657799760
puts :xyz.object_id # 1057308
puts :xyz.object_id # 1057308

p Symbol.all_symbols.size # 3232

# TESTS FOR SYMBOL INCLUSION ARE ALWAYS TRUE
# Because it will always be true! The very act of writing :abc in the include?
# test puts the symbol :abc into the symbol table
Symbol.all_symbols.include?(:abc)

def abc
  puts "aaa"
end

puts Symbol.all_symbols.size == 3233

puts "abc".send(:upcase) # ABC

puts joe_hash = {:name => "Joe", :age => 36} # {:name=>"Joe", :age=>36}
puts joe_hash[:age]
p Symbol.instance_methods(false).sort # [:<=>, :==, :===, :=~, :[], :capitalize, :casecmp, :casecmp?, :downcase, :empty?, :encoding, :id2name, :inspect, :intern, :length, :match, :match?, :next, :size, :slice, :succ, :swapcase, :to_proc, :to_s, :to_sym, :upcase]

puts "#########################"

puts sym = :david # david
puts sym.upcase # DAVID
puts sym.succ #davie
puts sym[2] #v
puts sym.casecmp(:david) # 0

def honest_test
  n = 99.6
  m = n.round
  puts m
  x = 12
  if x.zero?
    puts "x is zero"
  else
    puts "x is not zero"
  end
  puts "The ASCII character equivalent of 97 is #{97.chr}"
end

puts "#########################"

honest_test

# 100
# x is not zero
# The ASCII character equivalent of 97 is a
