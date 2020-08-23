###############
# Listing local and global variables

x = 1
p local_variables
# [:x]
p global_variables.sort
# [:$!, :$", :$$, :$&, :$', :$*, :$+, :$,, :$-0, :$-F, :$-I, :$-K, :$-W, :$-a, :$-d, :$-i, :$-l, :$-p, :$-v,
# :$-w, :$., :$/, :$0, :$:, :$;, :$<, :$=, :$>, :$?, :$@, :$DEBUG, :$FILENAME, :$KCODE, :$LOADED_FEATURES,
# :$LOAD_PATH, :$PROGRAM_NAME, :$SAFE, :$VERBOSE, :$\, :$_, :$`, :$stderr, :$stdin, :$stdout, :$~]

###############
# Listing instance variables
#
class Person
  attr_accessor :name, :age

  def initialize(name)
    @name = name
  end
end

joe = Person.new("Joe")
p joe.instance_variables
# [:@name]
joe.age = 37
p joe.instance_variables
# [:@name, :@age]

