# A range is an object with a start point and an end point.
# The semantics of range operations involve two major concepts:
# - Inclusion—Does a given value fall inside the range?
# - Enumeration—The range is treated as a traversable collection of individual items.

# In this example, the value 100 is included in the range
p r = Range.new(1,100) # 1..100
puts "#{r.begin} ~ #{r.end}. Exclude end? #{r.exclude_end?}" # 1 ~ 100. Exclude end? false
puts r.cover?(4) # true
puts r.cover?(101) # false
puts r.cover?(100) # true
puts r.cover?(99) # true
# But in this exclusive range, the value 100 lies beyond the effective end of the range
p r = Range.new(1,100,true) # 1...100
puts "#{r.begin} ~ #{r.end}. Exclude end? #{r.exclude_end?}" # 1 ~ 100. Exclude end? true
puts r.cover?(4) # true
puts r.cover?(101) # false
puts r.cover?(100) # false
puts r.cover?(99) # true
