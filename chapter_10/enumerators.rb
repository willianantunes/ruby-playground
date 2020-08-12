# Enumerators are closely related to iterators, but they aren’t the same thing.
# An iterator is a method that yields one or more values to a code block.
# An enumerator is an object, not a method.

# y is a yielder, an instance of Enumerator::Yielder, automatically passed to your block.
# Yielders encapsulate the yielding scenario that you want your enumerator to follow
e = Enumerator.new do |y|
  y << 1
  y << 2
  y << 3
end

# The enumerator `e` is an enumerating machine. It doesn’t contain objects;
# it has code associated with it—the original code block—that tells it what to
# do when it’s addressed in terms that it recognizes as coming from the Enumerable module
p e.to_a # [1, 2, 3]
p e.map { |x| x * 10 } # [10, 20, 30]
p e.select { |x| x > 1 } # [2, 3]
p e.take(2) # [1, 2]

e = Enumerator.new do |y|
  (1..3).each { |i| y << i }
end

e = Enumerator.new do |y|
  puts "Starting up the block!"
  (1..3).each { |i| y << i }
  puts "Exiting the block!"
end

p e.to_a
p e.select { |x| x > 2 }

# Starting up the block!
# Exiting the block!
# [1, 2, 3]
# Starting up the block!
# Exiting the block!
# [3]

a = [1, 2, 3, 4, 5]
e = Enumerator.new do |y|
  total = 0
  until a.empty?
    total += a.pop
    y << total
  end
end

p e.take(2) # [5, 9]
p e.to_a # [3, 5, 6]
p a # []

names = %w(David Black Yukihiro Matsumoto)
e = names.enum_for(:select)
p e # #<Enumerator: ["David", "Black", "Yukihiro", "Matsumoto"]:select>
p e.each { |n| n.include?('a') } # ["David", "Black", "Matsumoto"]

# You can also provide further arguments to enum_for.
# Any such arguments are passed through to the method to which the enumerator is being attached
e = names.enum_for(:inject, "Names: ")
p e.each { |string, name| string << "#{name}..." } # "Names: David...Black...Yukihiro...Matsumoto..."

str = "Hello"
# This thing:
p str.each_byte # #<Enumerator: "Hello":each_byte>
# Is the same as:
p str.enum_for(:each_byte) # #<Enumerator: "Hello":each_byte>


class PlayingCard
  SUITS = %w{ clubs diamonds hearts spades }
  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }

  class Deck
    def cards
      # If you want to protect the original array from change, you can duplicate it and pass
      # along the duplicate—or you can pass along an enumerator instead:
      @cards.to_enum
    end

    def initialize(n = 1)
      @cards = []
      SUITS.cycle(n) do |s|
        RANKS.cycle(1) do |r|
          @cards << "#{r} of #{s}"
        end
      end
    end
  end
end

names = %w(Salted Man)
e = names.to_enum
puts e.next # Salted
puts e.next # Man
e.rewind
puts e.next # Salted

module Music
  # Throughout, keep in mind the lesson of the Music::Scale object and its enumerator:
  # an enumerator is an enumerable object whose each method operates as a kind of siphon,
  # pulling values from an iterator defined on a different object.
  class Scale
    NOTES = %w(c c# d d# e f f# g a a# b)

    def play
      NOTES.each { |note| yield note }
    end
  end
end

scale = Music::Scale.new
scale.play { |note| puts "Next note is #{note}" }
enum = scale.enum_for(:play)
p enum.map { |note| note.upcase } # ["C", "C#", "D", "D#", "E", "F", "F#", "G", "A", "A#", "B"]
p enum.select { |note| note.include?('f') } # ["f", "f#"]
enum.with_index(1) { |note, i| puts "Note #{i}: #{note}" }
