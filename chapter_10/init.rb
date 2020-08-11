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
# find works by calling each
y_color = r.find { |color| color.start_with?('y') }
puts "First color starting with 'y' is #{y_color}." # First color starting with 'y' is yellow.

# Thanks to the false argument, the list includes only the methods defined in the Enumerable module itself.
# Each of these methods is built on top of each.
p Enumerable.instance_methods(false).sort # [:all?, :any?, :chain, :chunk, :chunk_while, :collect, :collect_concat, :count, :cycle, :detect, :drop, :drop_while, :each_cons, :each_entry, :each_slice, :each_with_index, :each_with_object, :entries, :filter, :find, :find_all, :find_index, :first, :flat_map, :grep, :grep_v, :group_by, :include?, :inject, :lazy, :map, :max, :max_by, :member?, :min, :min_by, :minmax, :minmax_by, :none?, :one?, :partition, :reduce, :reject, :reverse_each, :select, :slice_after, :slice_before, :slice_when, :sort, :sort_by, :sum, :take, :take_while, :to_a, :to_h, :uniq, :zip]


states = ["Louisiana"]
p states.include?("Louisiana") # true
p states.all? { |state| state =~ / / } # false
p states.any? { |state| state =~ / / } # false
p states.one? { |state| state =~ /West/ } # false
p states.none? { |state| state =~ /East/ } # trues

states = {"New Jersey" => "NJ",
          "Connecticut" => "CT",
          "Delaware" => "DE"}

p states.include?("Louisiana") # false
p states.all? { |state, abbr| state =~ / / } # false
p states.one? { |state, abbr| state =~ /West/ } # false

# Generating the entire keys array in advance, rather than walking through
# the hash that’s already there, is slightly wasteful of memory

p states.keys.all? { |state| state =~ / / } # false

def test_range_thing
  r = Range.new(1, 10)
  r.one? { |n| n == 5 }
  r.none? { |n| n % 2 == 0 }
  r = Range.new(1.0, 10.0)
  begin
    r.one? { |n| n == 5 }
  rescue => e
    puts "Following error caught: #{e.message}"
  end
  r = Range.new(1, 10.3)
  1..10.3
  r.any? { |n| n > 5 }
  true
end

test_range_thing


