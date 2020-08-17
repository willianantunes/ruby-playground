string = "A test string"
re = /A (sample) string/

begin
  p re.match(string) # nil
  substring = re.match(string)[1]
rescue NoMethodError
  puts "Yeah, you got an NoMethodError!"
end

class Regexp
  alias :old_match :match

  # This is not recommended!
  def match(string)
    old_match(string) || []
  end
end

p /abc/.match("X") # []

string = "Hello there!"
string.gsub!(/e/, "E").reverse!
string = "Hello there!"

begin
  string.gsub!(/zzz/, "xxx").reverse!
rescue NoMethodError
  puts "Yeah, you got an NoMethodError!"
end

class String
  alias :__old_gsub_bang__ :gsub!

  # This is not recommended!
  def gsub!(*args, &block)
    __old_gsub_bang__(*args, &block)
    self
  end
end

p string.gsub!(/zzz/, "xxx").reverse! # Now it works: "!ereht olleH"

# Using tap to circumvent the nil return of gsub! (or of other similarly behaving bang methods)
# can introduce complexities of its own, especially if you do multiple chaining, where some
# methods perform in-place operations and others return object copies.
"Hello".tap { |string| puts string.upcase }.reverse # HELLO

