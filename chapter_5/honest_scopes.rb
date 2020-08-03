# Global scope is scope that covers the entire program.
# Global scope is enjoyed by global variables, which are recognizable by their initial dollar-sign ($) character

$gvar = "I'm a global!"

class C7
  def examine_global
    puts $gvar
  end
end

c = C7.new
c.examine_global

# A good place to see descriptions of all the built-in global variables
# you’re likely to need—and then some—is the file English.rb
puts $0 # /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_5/honest_scopes.rb

class C
  a = 5
  module M
    a = 4
    module N
      a = 3
      class D
        a = 2
        def show_a
          a = 1
          puts a
        end
        puts a
      end
      puts a
    end
    puts a
  end
  puts a
end
d = C::M::N::D.new
d.show_a

# 2
# 3
# 4
# 5
# 1
