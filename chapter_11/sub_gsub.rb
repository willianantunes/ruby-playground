# The difference between them is that gsub (global substitution) makes changes
# throughout a string, whereas sub makes at most one substitution.
p "typigraphical error".sub(/i/,"o") # "typographical error"

p "capitalize the first vowel".sub(/[aeiou]/) {|s| s.upcase } # "cApitalize the first vowel"
p "capitalize every word".gsub(/\b\w/) {|s| s.upcase } # "Capitalize Every Word"
p "aDvid".sub(/([a-z])([A-Z])/, '\2\1') # "David"
p "double every word".gsub(/\b(\w+)/, '\1 \1') # "double double every every word word"
