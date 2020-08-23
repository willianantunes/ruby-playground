module M
  # It will be triggered when someone include M in another guy
  def self.included(c)
    puts "I have just been mixed into #{c}."
  end
end

class C
  include M
end

module M
  def self.included(cl)
    def cl.a_class_method
      puts "Now the class has a new class method."
    end
  end

  def an_inst_method
    puts "This module supplies this instance method."
  end
end

class C
  include M
end

C.a_class_method
c = C.new
c.an_inst_method

puts "######"

module Cockatiel
  def self.extended(obj)
    puts "Module #{self} is being used by #{obj}."
  end

  def an_inst_method
    puts "This module supplies this instance method."
  end
end

my_object = Object.new
my_object.extend(Cockatiel)
my_object.an_inst_method

puts "######"

module CockatielNew
  def self.included(c)
    puts "#{self} included by #{c}."
  end

  def self.extended(obj)
    puts "#{self} extended by #{obj}."
  end
end

obj = Object.new
puts "Including M in object's singleton class:"

class << obj
  include CockatielNew
end

obj = Object.new
puts "Extending object with M:"
obj.extend(CockatielNew)

