p [1, 2, 3, 4].first # 1
p (1..10).first # 1
p ({1 => 2, "one two" => "three"}).first # 1

# The object returned by first is the same as the first object you get when you iterate through the parent object.
# In other words, it’s the first thing yielded by each
address = {city: "New York", state: "NY", zip: "10027"}
p address.first # [:city, "New York"]
address[:zip] = "10018"
p address.first # [:city, "New York"]

class Die
  include Enumerable

  def each
    loop do
      yield rand(6) + 1
    end
  end
end

# Perhaps the most noteworthy point about Enumerable#first is that there’s no Enumerable#last
# Die.new.each { |i| puts i}

def roll_it
  puts "Welcome to 'You Win If You Roll a 6'!"
  d = Die.new
  d.each do |roll|
    puts "You rolled a #{roll}."
    if roll == 6
      puts "You win!"
      break
    end
  end
end

roll_it

states = %w(NJ NY CT MA VT FL)
p states.take(2) # ["NJ", "NY"]
p states.drop(2) # ["CT", "MA", "VT", "FL"]

p states.take_while { |s| /N/.match(s) } # ["NJ", "NY"]
p states.drop_while { |s| /N/.match(s) } # ["CT", "MA", "VT", "FL"]
# unshift adds an element to the beginning of an array
p states.unshift("NE") # ["NE", "NJ", "NY", "CT", "MA", "VT", "FL"]
p states.take(2) { |s| /N/.match(s) } # ["NE", "NJ"]

# Minimum and maximum are determined by the <=> (spaceship comparison operator) logic
p [1, 3, 5, 4, 2].min # 1
p [1, 3, 5, 4, 2].max # 5
p [1, 3, 5, 4, 2].sum # 15
p %w(Ruby C APL Perl Smalltalk).min # "APL"
p %w(Ruby C APL Perl Smalltalk).min { |a, b| a.size <=> b.size } # C
p %w{ Ruby C APL Perl Smalltalk }.min_by { |lang| lang.size } # C
p %w{ Ruby C APL Perl Smalltalk }.minmax # ["APL", "Smalltalk"]
p %w{ Ruby C APL Perl Smalltalk }.minmax_by { |lang| lang.size } # ["C", "Smalltalk"]

state_hash = {"New York" => "NY", "Maine" => "ME",
              "Alaska" => "AK", "Alabama" => "AL"}
p state_hash.min # ["Alabama", "AL"]
p state_hash.min_by { |name, abbr| name } # ["Alabama", "AL"]
p state_hash.min_by { |name, abbr| abbr } # ["Alaska", "AK"]



