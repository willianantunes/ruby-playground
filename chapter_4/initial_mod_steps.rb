module MyFirstModule
  def ruby_version
    system("ruby -v")
  end
end

# When you write a class, you then create instances of the class.
# Those instances can execute the class’s instance methods.
# In contrast, modules don’t have instances. Instead, modules get mixed in to classes,
# using the include method or the prepend method.

class ModuleTester
  include MyFirstModule
end

mt = ModuleTester.new
mt.ruby_version
