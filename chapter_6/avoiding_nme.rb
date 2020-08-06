# Another common cause of NoMethodError exceptions is when methods are
# unintentionally called on nil. This is where the safe navigation operator, &., can help us

class Roster
  attr_accessor :players
end

class Player
  attr_accessor :name, :position

  def initialize(name, position)
    @name = name
    @position = position
  end
end

moore = Player.new("Maya Moore", "Forward")
taurasi = Player.new("Diana Taurasi", "Guard")
tourney_roster1 = Roster.new
tourney_roster1.players = [moore, taurasi]

if tourney_roster1.players.first.position == "Forward"
  puts "Forward: #{tourney_roster1.players.first.name}"
end

tourney_roster2 = Roster.new
# if tourney_roster2.players.first.position == "Forward" # undefined method `first' for nil:NilClass (NoMethodError)
#   puts "Forward: #{tourney_roster1.players.first.name}"
# end

# we can use the safe navigation operator to avoid the NoMethodError
if tourney_roster2.players&.first&.position == "Forward"
  puts "Forward: #{tourney_roster1.players.first.name}"
end
