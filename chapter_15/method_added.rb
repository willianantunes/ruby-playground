class C
  def self.method_added(m)
    puts "Method #{m} was just defined."
  end

  def a_new_method
  end
end

# Method a_new_method was just defined.

class C
  # The singleton_method_added callback does much the same thing as method_added,
  # but for singleton methods. Perhaps surprisingly, it even triggers itself
  def self.singleton_method_added(m)
    puts "Method #{m} was just defined."
  end
end

class C
  def self.new_class_method
  end
end


# In most cases, you should use singleton_method_added with objects other than class objects.
# Here’s how its use might play out with a generic object
obj = Object.new

def obj.singleton_method_added(m)
  puts "Singleton method #{m} was just defined."
end

def obj.a_new_singleton_method
end

obj = Object.new

class << obj
  def singleton_method_added(m)
    puts "Singleton method #{m} was just defined."
  end

  def a_new_singleton_method
  end
end

class C
  def singleton_method_added(m)
    puts "Singleton method #{m} was just defined."
  end
end

c = C.new

def c.a_singleton_method
end

# Method a_new_method was just defined.
# Method singleton_method_added was just defined.
# Method new_class_method was just defined.
# Singleton method singleton_method_added was just defined.
# Singleton method a_new_singleton_method was just defined.
# Singleton method singleton_method_added was just defined.
# Singleton method a_new_singleton_method was just defined.
# Method singleton_method_added was just defined.
# Singleton method a_singleton_method was just defined.
