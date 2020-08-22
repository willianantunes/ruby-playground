# Ruby has a facility for executing code stored in the form of strings at runtime
p eval("2+2") # 4

def type_the_method_name_and_execute_it
  print "Method name: "
  m = gets.chomp
  eval("def #{m}; puts 'Hi!'; end")
  eval(m) # Hi!
end

p self # main
a = []
# This kind of prying into another object’s state is generally considered impolite
# Nevertheless, because Ruby dynamics are based on the changing identity of self,
# it’s not a bad idea for the language to give us a technique for manipulating self directly
a.instance_eval { p self } # []

class C
  def initialize
    @x = 1
  end
end

c = C.new
c.instance_eval { puts @x } # 1

string = "A sample string"
p string.instance_exec("s") { |delim| self.split(delim) } # ["A ", "ample ", "tring"]

class Person
  def initialize(&block)
    instance_eval(&block)
  end

  def name(name = nil)
    @name ||= name
  end

  def age(age = nil)
    @age ||= age
  end
end

# The key here is the call to instance_eval, which reuses the code block that has already been
# passed in to new. Because the code block is being instance_eval-ed on the new person object
# (the implicit self in the definition of initialize), the calls to name and age are resolved
# within the Person class
joe = Person.new do
  # Lots of Rubyists find this kind of miniature DSL (domain-specific language)
  # quite pleasingly compact and elegant
  name "Joe"
  age 37
end

p joe # #<Person:0x00007fb90a0cbdc0 @name="Joe", @age=37>


c = Class.new
# When you open a class with the class keyword, you start a new local-variable scope.
# But the block you use with class_eval can see the variables created in the scope surrounding it
c.class_eval do
  def some_method
    puts "Created in class_eval"
  end
end

c_instance = c.new
c_instance.some_method # Created in class_eval


var = "initialized variable VAR"

begin
  class Cockatiel
    puts var
  end
rescue NameError => e
  puts "Yeah! Undefined local variable because of var"
end

Cockatiel.class_eval {
  def talk
    puts var;
  end
}

begin
  Cockatiel.new.talk
rescue NameError => e
  puts "Yeah! Undefined local variable because of var"
end

Cockatiel.class_eval { define_method ("talk") { puts var } }
Cockatiel.new.talk # initialized variable VAR

# A Name class that accepts a first and last name. It will then leverage method_missing to define an
# instance variable with the given name
class Name
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s
    instance_variables.each do |ivar|
      print "#{instance_variable_get(ivar)} "
    end
  end

  def method_missing(m, args, &block)
    if m.to_s.end_with?("_name=")
      self.class.send(:define_method, m) do |args|
        instance_variable_set("@#{m.to_s.chop}", args)
      end
      send(m, args)
    else
      raise "No method for #{m}!"
    end
  end
end

puts "#####################"

n = Name.new("Joe", "Leo")
p n.instance_variables # [:@first_name, :@last_name]
p n.to_s # Joe Leo [:@first_name, :@last_name]
n.middle_name = "Phillip"
p n.instance_variables # [:@first_name, :@last_name, :@middle_name]
p n.to_s # Joe Leo Phillip [:@first_name, :@last_name, :@middle_name]
begin
  n.initials = "JPL"
rescue => e
  puts e.message # No method for initials=!
end
