class Person
  attr_accessor :name

  def self.to_proc
    Proc.new { |person| person.name }
  end
end

d = Person.new
d.name = "Jafar"
j = Person.new
j.name = "Iago"
puts [d, j].map(&Person)

p %w{ Jasmine Aladdin }.map(&:capitalize) # ["Jasmine", "Aladdin"]
p %w{ Jasmine Aladdin }.map &:capitalize # ["Jasmine", "Aladdin"]

# The symbol :capitalize is interpreted as a message to be sent to each element of the array in turn.
# The previous code is thus equivalent to
p %w{ Jasmine Aladdin }.map { |str| str.capitalize } # ["Jasmine", "Aladdin"]
p %w{ Jasmine Aladdin }.map {|str| str.public_send(:capitalize) } # ["Jasmine", "Aladdin"]
