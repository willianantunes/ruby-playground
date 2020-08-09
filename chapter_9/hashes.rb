def know_the_abbreviation
  # Hashes remember the insertion order of their keys. Insertion order
  # isn’t always terribly important; one of the merits of a hash is
  # that it provides quick lookup in better-than-linear time
  state_hash = {"Connecticut" => "CT",
                "Delaware" => "DE",
                "New Jersey" => "NJ",
                "Virginia" => "VA"}
  print "Enter the name of a state: "
  state = gets.chomp
  abbr = state_hash[state]
  puts "The abbreviation is #{abbr}."
end

# 4 ways to create a hash:
# - With the literal constructor (curly braces)
# - With the Hash.new method
# - With the Hash.[] method (a square-bracket class method of Hash)
# - With the top-level method whose name is Hash

p this_is_a_hash = {} # {}
p this_is_a_hash = Hash["Connecticut", "CT", "Delaware", "DE"] # {"Connecticut"=>"CT", "Delaware"=>"DE"}
p this_is_a_hash = Hash[[[1, 2], [3, 4], [5, 6]]] # {1=>2, 3=>4, 5=>6}


state_hash = {"Connecticut" => "CT",
              "Delaware" => "DE",
              "New Jersey" => "NJ",
              "Virginia" => "VA"}
# To add a state to state_hash, do this,
state_hash["New York"] = "NY"
# which is the sugared version of this:
state_hash.[]=("New York", "NY")
# You can also use the synonymous method store for this operation. store takes two arguments (a key and a value):
state_hash.store("New York", "NY")
p state_hash # {"Connecticut"=>"CT", "Delaware"=>"DE", "New Jersey"=>"NJ", "Virginia"=>"VA", "New York"=>"NY"}

# Using a hash key is much like indexing an array—except that the
# index (the key) can be anything, whereas in an array, it’s always an integer.
h = Hash.new
h["a"] = 1
h["a"] = 2
p h # {"a"=>2}
puts h["a"] # 2


p state_hash.fetch("Nebraska", "Unknown state") # it retrieves "Unknown state"

state_hash = {"New Jersey" => "NJ",
              "Connecticut" => "CT",
              "Delaware" => "DE"}
# You can also retrieve values for multiple keys in one operation, with values_at
two_states = state_hash.values_at("New Jersey", "Delaware")
p two_states # ["NJ", "DE"]
begin
  # fetch_values behaves similarly, but it raises a KeyError if the requested key isn’t found
  state_hash.fetch_values("salted")
rescue => e
  puts "You got the expected error: #{e.message}" # You got the expected error: key not found: "salted"
end

# To create a default behavior, pass a block to fetch or fetch_values.
# Rather than raising an error, the unknown key will be appended to the resulting array

greg = state_hash.fetch_values("New Jersey", "WYOMING") do |key|
  key.capitalize
end
p greg # ["NJ", "Wyoming"]

# Like arrays, hashes can be nested within other hashes.
# This is a powerful way to store collections of data and is used frequently.
p nested_hash = {foo: {bar: "baz"}} # {:foo=>{:bar=>"baz"}}
p contacts = {john: {
    phone: "555-1234",
    email: "john@example.com"},
            eric: {
                phone: "555-1235",
                email: "eric@example.com"}} # {:john=>{:phone=>"555-1234", :email=>"john@example.com"}, :eric=>{:phone=>"555-1235", :email=>"eric@example.com"}}

# The dig method makes such collections more easily accessible. Hash#dig takes one or more symbols as arguments
p contacts.dig(:eric, :email) # "eric@example.com"
