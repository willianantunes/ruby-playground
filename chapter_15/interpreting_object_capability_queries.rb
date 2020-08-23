###############
# Listing an object’s non-private methods

string = "Test string"
# How you might ask a string what methods it knows about that involve modification of case:
p string.methods.grep(/case/).sort
# [:casecmp, :casecmp?, :downcase, :downcase!, :swapcase, :swapcase!, :upcase, :upcase!]
p string.methods.grep(/.!/).sort
# [:capitalize!, :chomp!, :chop!, :delete!, :delete_prefix!, :delete_suffix!, :downcase!, :encode!, :gsub!, :lstrip!, :next!, :reverse!, :rstrip!, :scrub!, :slice!, :squeeze!, :strip!, :sub!, :succ!, :swapcase!, :tr!, :tr_s!, :unicode_normalize!, :upcase!]

methods = string.methods
bangs = string.methods.grep(/.!/)
unmatched = bangs.reject do |b|
  methods.include?(b[0..-2].to_sym)
end
if unmatched.empty?
  puts "All bang methods are matched by non-bang methods."
else
  puts "Some bang methods have no non-bang partner: "
  puts unmatched
end

###############
# Listing private and protected methods
o = Object.new
p o.private_methods.size # 75
p o.protected_methods.size # 0

object_private_methods = o.private_methods
bo_private_instance_method_without_super = BasicObject.private_instance_methods(false)
kernel_private_instance_method_without_super = Kernel.private_instance_methods(false)
lets_see = object_private_methods - bo_private_instance_method_without_super - kernel_private_instance_method_without_super
# Note that after you subtract the private methods defined in Kernel and BasicObject,
# the remaining method is :DelegateClass, the only private method defined on Object
p lets_see # [:DelegateClass]

class Person
  attr_reader :name

  def name=(name)
    @name = name
    normalize_name
  end

  private

  def normalize_name
    name.gsub!(/[^-a-z'.\s]/i, "")
  end
end

david = Person.new
david.name = "123David!! Bl%a9ck"
raise "Problem" unless david.name == "David Black"
puts "Name has been normalized."
p david.private_methods.sort.grep(/normal/) # [:normalize_name]

###############
# Getting class and module instance methods

p String.methods.grep(/methods/).sort
# [:instance_methods, :methods, :private_instance_methods, :private_methods, :protected_instance_methods,
# :protected_methods, :public_instance_methods, :public_methods, :singleton_methods]

p Range.instance_methods(false).sort
# [:%, :==, :===, :begin, :bsearch, :cover?, :each, :end, :entries, :eql?, :exclude_end?, :first,
# :hash, :include?, :inspect, :last, :max, :member?, :min, :size, :step, :to_a, :to_s]

# Going one step further, what if you want to know which of the methods defined in the Enumerable
# module are overridden in Range? You can find out by performing an and (&) operation on the
# two lists of instance methods: those defined in Enumerable and those defined in Range
p Range.instance_methods(false) & Enumerable.instance_methods(false)
# [:entries, :to_a, :include?, :first, :min, :member?, :max]

###############
# Getting all the Enumerable overrides

overrides = {}
enum_classes = ObjectSpace.each_object(Class).select do |c|
  c.ancestors.include?(Enumerable) && c.name
end
enum_classes.sort_by { |c| c.name }.each do |c|
  overrides[c] = c.instance_methods(false) &
      Enumerable.instance_methods(false)
end
overrides.delete_if { |c, methods| methods.empty? }
overrides.each do |c, methods|
  puts "Class #{c} overrides: #{methods.sort.join(", ")}"
end

# Class ARGF.class overrides: to_a
# Class Array overrides: all?, any?, collect, count, cycle, drop, drop_while, filter, find_index, first, include?, map, max, min, none?, one?, reject, reverse_each, select, sort, sum, take, take_while, to_a, to_h, uniq, zip
# Class Enumerator overrides: each_with_index, each_with_object
# Class Enumerator::ArithmeticSequence overrides: first
# Class Enumerator::Lazy overrides: chunk, chunk_while, collect, collect_concat, drop, drop_while, filter, find_all, flat_map, grep, grep_v, lazy, map, reject, select, slice_after, slice_before, slice_when, take, take_while, uniq, zip
# Class Gem::List overrides: to_a
# Class Hash overrides: any?, filter, include?, member?, reject, select, to_a, to_h
# Class ObjectSpace::WeakMap overrides: include?, member?
# Class Range overrides: entries, first, include?, max, member?, min, to_a
# Class Struct overrides: filter, select, to_a, to_h

###############
# Listing objects’ singleton methods

puts "#########"

class Cockatiel
end

c = Cockatiel.new

class << c
  def x
  end

  def y
  end

  def z
  end

  protected :y
  private :z
end

# Note that singleton_methods lists public and protected singleton methods but not private ones
p c.singleton_methods.sort # [:x, :y]

class << c
  p private_instance_methods(false) # [:z]
end

# The call to singleton_methods(false) provides only the singleton methods defined on File.
# The call without the false argument provides all the singleton methods defined on File and its ancestors.
# The difference is the ones defined by the ancestors.
p File.singleton_methods - File.singleton_methods(false)
# [:open, :readlines, :new, :write, :read, :select, :sysopen, :for_fd, :popen,
# :foreach, :binread, :binwrite, :pipe, :try_convert, :copy_stream]

# The superclass of File is IO. Interestingly, although not surprisingly, all 15 of the
# ancestral singleton methods available to File are defined in IO.
# You can confirm this with another query
p IO.singleton_methods(false)
# [:open, :readlines, :new, :write, :read, :select, :sysopen, :for_fd, :popen,
# :foreach, :binread, :binwrite, :pipe, :try_convert, :copy_stream]
