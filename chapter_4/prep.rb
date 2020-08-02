module MeFirst
  def report
    puts "Hello from module!"
  end
end

class Person
  # include MeFirst
  # The difference is that if you prepend a module to a class, the object looks
  # in that module first, before it looks in the class.
  prepend MeFirst

  def report
    puts "Hello from class!"
  end
end

p = Person.new
p.report