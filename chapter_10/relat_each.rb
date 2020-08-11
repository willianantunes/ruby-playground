# You have to be careful with reverse_each.
# Don’t use it on an infinite iterator, since the concept of going in reverse depends on
# the concept of knowing what the last element is which is a meaningless concept in the case of an infinite iterator
[1, 2, 3].reverse_each { |e| puts e * 10 }
# 30
# 20
# 10

names = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison"]
names.each_with_index do |pres, i|
  puts "#{i + 1}. #{pres}"
end

# 1. George Washington
# 2. John Adams
# 3. Thomas Jefferson
# 4. James Madison

names.each.with_index(1) do |pres, i|
  puts "#{i} #{pres}"
end

# 1 George Washington
# 2 John Adams
# 3 Thomas Jefferson
# 4 James Madison

# The difference between them (each_slice and each_cons) is that each_slice handles
# each element only once, whereas each_cons takes a new grouping at each element and
# thus produces overlapping yielded arrays
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.each_slice(3) { |slice| p slice }
# [1, 2, 3]
# [4, 5, 6]
# [7, 8, 9]
# [10]
array.each_cons(3) { |cons| p cons }
# [1, 2, 3]
# [2, 3, 4]
# [3, 4, 5]
# [4, 5, 6]
# [5, 6, 7]
# [6, 7, 8]
# [7, 8, 9]
# [8, 9, 10]

parsed_report = ["Top Secret Report", "Eyes Only", "=====", "Title: The Meaning of Life"]
# slice_before will split a collection at the point at which a given criterion is matched
p parsed_report.slice_before(/=/).to_a # [["Top Secret Report", "Eyes Only"], ["=====", "Title: The Meaning of Life"]]

parsed_report = ["Top Secret Report", "Eyes Only", "=====",
                 "Title: The Meaning of Life", "Author: [REDACTED]",
                 "Date: 2018-01-01", "=====", "Abstract:\n"]
# slice_after is a complement to slice_before, slotting items into groups after the pattern or Boolean test is found
p parsed_report.slice_after(/=/).to_a # [["Top Secret Report", "Eyes Only", "====="], ["Title: The Meaning of Life", "Author: [REDACTED]", "Date: 2018-01-01", "====="], ["Abstract:\n"]]

p (1..10).slice_before { |num| num % 2 == 0 }.to_a # [[1], [2, 3], [4, 5], [6, 7], [8, 9], [10]]

result = File.open("report.txt").slice_before do |line|
  line.start_with?("=")
end.to_a
p result # [["Top Secret Report\n", "Eyes Only\n"], ["=====\n", "Title: The Meaning of Life\n", "Author: [REDACTED]\n", "Date: 2018-01-01\n"], ["=====\n", "Abstract:\n", "In this report I give you the meaning of life, plain and simple.\n"]]

p [1, 2, 3, 3, 4, 5, 6, 6, 7, 8, 8, 8, 9, 10].slice_when { |i, j| i == j }.to_a # [[1,2,3],[3,4,5,6],[6,7,8],[8],[8,9,10]]


# You can use cycle to decide dynamically how many times you want to iterate through
# a collection—essentially, how many each-like runs you want to perform consecutively
class PlayingCard
  SUITS = %w(clubs diamonds hearts spades)
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  class Deck
    attr_reader :cards

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

deck = PlayingCard::Deck.new(2)
puts deck.cards.size # 104

# The inject method (a.k.a. reduce and similar to “fold” methods in functional languages)
# works by initializing an accumulator object and then iterating through a
# collection (an enumerable object), performing a calculation on each iteration and
# resetting the accumulator, for purposes of the next iteration, to the result of that calculation
p [1, 2, 3, 4].inject(0) { |acc, n| acc + n } # 10

# Passing the :+ method to inject tells Ruby to use a 0-based accumulator and
# obviates the need for an explicit accumulators
p [1, 2, 3, 4].inject(:+) # 10

[1, 2, 3, 4].inject do |acc, n|
  puts "adding #{acc} and #{n}...#{acc + n}"
  acc + n
end

# adding 1 and 2...3
# adding 3 and 3...6
# adding 6 and 4...10
