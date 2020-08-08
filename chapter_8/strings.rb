puts "Two plus two is #{2 + 2}."
puts 'Two plus two is #{2 + 2}.'
puts "Escaped interpolation: \"\#{2 + 2}\"."
puts "Backslashes (\\) have to be escaped in double quotes."
puts 'You can just type \ once in a single quoted string.'
puts "But whichever type of quotation mark you use..."
puts "...you have to escape its quotation symbol, such as \"."
puts 'That applies to \' in single-quoted strings too.'
puts 'Backslash-n just looks like \n between single quotes.'
puts "But it means newline\nin a double-quoted string."
puts 'Same with \t, which comes out as \t with single quotes...'
puts "...but inserts a tab character:\tinside double quotes."
puts "You can escape the backslash to get \\n and \\t with double quotes."
puts %q{You needn't escape apostrophes or quotation marks (', '', ", "") when using %q.}

puts %q-A string-
puts %Q/Another string/
puts %[Yet another string]

# If you’re using {} as a delimiter and Ruby sees a left-hand
# brace inside the string, it assumes that the brace is part of the
# string and looks for a matching right-hand one
puts %Q{I can put {} in here unescaped.}
puts %q{I have to escape \(if I use it alone in here.)}
puts %Q{And the same goes for \}.}

puts "###########################"

# https://en.wikipedia.org/wiki/Here_document#Ruby
text = <<EOM
This is the first line of text.
This is the second line.
Now we're done.
EOM
puts text

puts "###########################"

# The expression <<EOM means the text that follows, up to but not including
# the next occurrence of “EOM.” The delimiter can be
# any string; EOM (end of message) is a common choice

query = <<SQL
SELECT count (DISTINCT users.id)
FROM users
WHERE users.first_name='Joe';
SQL
puts query

puts "###########################"

# You can switch off the flush-left requirement by putting a hyphen before the << operator
text = <<-EOM
The EOM doesn't have 
  to be flush left!
EOM
puts text

puts "###########################"

class RubyWelcomeWagon
  def message
    # By replacing <<- with <<~ above, the leading whitespace
    # is stripped away and the message isn’t indented
    # <<~EOM
    <<-EOM
      Welcome to the world of Ruby!
      We're happy you're here!
    EOM
  end
end

puts RubyWelcomeWagon.new.message

puts "###########################"

text = <<-'EOM'
Single-quoted!
Note the literal \n.
And the literal #{2 + 2}.
EOM

puts text

puts "###########################"

array = [1,2,3, <<EOM, 4]
This is the heredoc!
It becomes array[3].
EOM
p array # [1, 2, 3, "This is the heredoc!\nIt becomes array[3].\n", 4]

puts "###########################"

def do_something_with_args(a,b,c)
  puts c
end

# And you can use the <<EOM notation as a method argument; the argument
# becomes the heredoc that follows the line on which the method call occurs.
# This can be useful if you want to avoid cramming too much text
do_something_with_args(15, 20, <<EOM)
http://some_very_long_url_or_other_text_best_put_on_its_own_line
  GREG
EOM
