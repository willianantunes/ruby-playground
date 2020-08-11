p [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].find { |n| n > 5 } # 6
p [1, 2, 3, nil, 4, 5, 6].find { |n| n.nil? } # nil

failure_handler = lambda { puts "Find has failed!" }
over_ten = [1, 2, 3, 4, 5, 6].find(failure_handler) { |n| n > 10 }
p over_ten # nil


a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.find_all { |item| item > 5 } # [6, 7, 8, 9, 10]
p a.select { |item| item > 100 } # []
p a.reject { |item| item > 5 } # [1, 2, 3, 4, 5]


colors = %w(red orange yellow green blue indigo violet)
p colors.grep(/o/) # ["orange", "yellow", "indigo", "violet"]
p colors.grep(/o/) { |color| color.capitalize } # ["Orange", "Yellow", "Indigo", "Violet"]
p colors.group_by { |color| color.size } # {3=>["red"], 6=>["orange", "yellow", "indigo", "violet"], 5=>["green"], 4=>["blue"]}

miscellany = [75, "hello", 10...20, "goodbye"]
p miscellany.grep(String) # ["hello", "goodbye"]
p miscellany.grep(50..100) # [75]
p miscellany.grep(Range) # [10...20]

class Person
  attr_accessor :age

  def initialize(options)
    self.age = options[:age]
  end

  def teenager?
    (13..19) === age
  end
end


p people = 10.step(25, 3).map { |i| Person.new(:age => i) }
# Note that this is an array containing two subarrays.
# The first contains those people for whom person.teenager? returned true; the second is the non-teens
p teens = people.partition { |person| person.teenager? }
puts "#{teens[0].size} teens; #{teens[1].size} non-teens" # 3 teens; 3 non-teens
