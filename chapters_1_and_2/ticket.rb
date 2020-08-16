ticket = Object.new

def ticket.date
  "1903-01-02"
end

def ticket.venue
  "Town Hall"
end

def ticket.event
  "Author's reading"
end

def ticket.performer
  "Mark Twain"
end

def ticket.seat
  "Second Balcony, row J, seat 12"
end

def ticket.price
  5.50
end

print "This ticket is for: "
print ticket.event + ", at "
print ticket.venue + ", on "
puts ticket.date + "."
print "The performer is "
puts ticket.performer + "."
print "The seat is "
print ticket.seat + ", "
print "and it costs $"
puts "%.2f." % ticket.price

puts puts

puts "This ticket is for: #{ticket.event}, at #{ticket.venue}.\n" +
         "The performer is #{ticket.performer}.\n" +
         "The seat is #{ticket.seat}, " +
         "and it costs $#{"%.2f." % ticket.price}"


# [:!, :!=, :!~, :<=>, :==, :===, :=~, :__id__, :__send__, :class, :clone, :define_singleton_method,
# :display, :dup, :enum_for, :eql?, :equal?, :extend, :freeze, :frozen?, :hash, :inspect, :instance_eval,
# :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set,
# :instance_variables, :is_a?, :itself, :kind_of?, :method, :methods, :nil?, :object_id, :private_methods,
# :protected_methods, :public_method, :public_methods, :public_send, :remove_instance_variable, :respond_to?,
# :send, :singleton_class, :singleton_method, :singleton_methods, :taint, :tainted?, :tap, :then, :to_enum,
# :to_s, :trust, :untaint, :untrust, :untrusted?, :yield_self]
# p Object.new.methods.sort


def ticket.print_details(*x)
  x.each { |detail| puts "This ticket is #{detail}" }
end

ticket.print_details "calopsita", "jafar", "salt"

str = "Hello"
abc = str
str = "Goodbye"
puts str
puts abc