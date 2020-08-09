# Set is the one class under discussion in this chapter that isn’t, strictly speaking, a Ruby core class.
# It’s a standard library class, which means that to use it, you have to do this
require 'set'


new_england = ["Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont", "Vermont", "Vermont"]
p state_set = Set.new(new_england) # #<Set: {"Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"}>

names = ["David", "Yukihiro", "Chad", "Amy"]
p name_set = Set.new(names) { |name| name.upcase } # #<Set: {"DAVID", "YUKIHIRO", "CHAD", "AMY"}>

tri_state = Set.new(["New Jersey", "New York"])
tri_state << "Connecticut"
tri_state << "Connecticut"
p tri_state # #<Set: {"New Jersey", "New York", "Connecticut"}>
tri_state.delete("Connecticut")
tri_state.delete("Connecticut")
p tri_state # #<Set: {"New Jersey", "New York"}>
# The << method is also available as add. There’s also a method called add?,
# which differs from add in that it returns nil (rather than returning the set itself)
# if the set is unchanged after the operation
p tri_state.add?("Pennsylvania") # #<Set: {"New Jersey", "New York", "Pennsylvania"}>
p tri_state.add?("Pennsylvania") # nil

puts "#########"

state_set = Set.new(["Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont", "Vermont", "Vermont"])
tri_state = Set.new(["Connecticut", "New Jersey", "New York"])
# Subtraction (difference/-)
p state_set - tri_state # #<Set: {"Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"}>
# Addition (union/+/|)
p state_set + tri_state # #<Set: {"Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont", "New Jersey", "New York"}>
# Intersection (&)
p state_set & tri_state # #<Set: {"Connecticut"}>
# Union (+ or |)
p state_set | tri_state # #<Set: {"Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont", "New Jersey", "New York"}>
# There’s also an exclusive-or operator, ^, which you can use to take the
# exclusive union between a set and an enumerable
p state_set ^ tri_state # #<Set: {"New Jersey", "New York", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"}>


tri_state = Set.new(["Connecticut", "New Jersey"])
puts tri_state.object_id # 70252163916360
tri_state.merge(["New York"])
puts tri_state.object_id # 70252163916360
p tri_state # #<Set: {"Connecticut", "New Jersey", "New York"}>

s = Set.new([1, 2, 3])
p s.merge({"New Jersey" => "NJ", "Maine" => "ME"}) # #<Set: {1, 2, 3, ["New Jersey", "NJ"], ["Maine", "ME"]}>


small_states = Set.new(["Connecticut", "Delaware", "Rhode Island"])
tiny_states = Set.new(["Delaware", "Rhode Island"])
p tiny_states.subset?(small_states) # true
p small_states.superset?(tiny_states) # true
