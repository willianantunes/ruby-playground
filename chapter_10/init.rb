# You can mix Enumerable into your own classes
class C
  include Enumerable
end

# By itself, that doesn’t do much. To tap into the benefits of Enumerable,
# you must define an each instance method in your class
class C
  include Enumerable

  def each
    # relevant code here
  end
end

# Enumerators are objects that encapsulate knowledge of how to iterate through a particular collection.
# By packaging iteration intelligence in an object that’s separate from the collection itself,
# enumerators add a further and powerful dimension to Ruby’s already considerable
# collection-manipulation facilities

puts "###### Gaining enumerability through each"

# Any class that aspires to be enumerable must have an each method whose job is to yield
# items to a supplied code block, one at a time.

class Rainbow
  include Enumerable

  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "indigo"
    yield "violet"
  end
end

r = Rainbow.new
r.each do |color|
  puts "Next color: #{color}"
end

# Because Rainbow mixed in the Enumerable module, rainbows are automatically endowed
# with a whole slew of methods built on top of the each method.

r = Rainbow.new
y_color = r.find { |color| color.start_with?('y') }
puts "First color starting with 'y' is #{y_color}." # First color starting with 'y' is yellow.

