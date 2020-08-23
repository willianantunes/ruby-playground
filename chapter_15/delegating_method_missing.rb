class Cookbook
  attr_accessor :title, :author

  def initialize
    @recipes = []
  end

  def method_missing(m, *args, &block)
    @recipes.public_send(m, *args, &block)
  end
end

class Recipe
  attr_accessor :main_ingredient

  def initialize(main_ingredient)
    @main_ingredient = main_ingredient
  end
end

cb = Cookbook.new
recipe_for_cake = Recipe.new("flour")
recipe_for_chicken = Recipe.new("chicken")
cb << recipe_for_cake
cb << recipe_for_chicken
chicken_dishes = cb.select { |recipes| recipes.main_ingredient == "chicken" }
chicken_dishes.each { |dish| puts dish.main_ingredient } # chicken

# An oft-cited problem with method_missing is that it doesn’t align with respond_to?
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name, @age = name, age
  end

  def method_missing(m, *args, &block)
    if /set_(.*)/.match(m)
      self.public_send("#{$1}=", *args)
    else
      super
    end
  end
end

person = Person.new("Joe", 37)
person.set_age(38)
p person.age
# So does an instance of person have a set_age method, or not?
# Well, you can call that method, but the person object claims it doesn’t respond to it
p person.respond_to?(:set_age) # false

class Person
  # You can control whether private methods are included by using a second argument to respond_to?
  def respond_to_missing?(m, include_private = false)
    /set_/.match(m) || super
  end
end

p person.age # 38
p person.respond_to?(:set_age) # true

person = Person.new("Joe", 37)
# As a bonus, methods that become visible through respond_to_missing? can also be objectified
# into method objects using method
p person.method(:set_age) # #<Method: Person#set_age>

