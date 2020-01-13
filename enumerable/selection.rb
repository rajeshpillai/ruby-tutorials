require_relative "player"
require_relative "team"

player1 = Player.new("Rajesh", 21, 3)
player2 = Player.new("Radhika", 19, 5)
player3 = Player.new("Jai", 20, 4)
player4 = Player.new("Urvashi", 18, 5)
player5 = Player.new("Smeeta", 19, 4)
player6 = Player.new("Rohan", 9, 5)

red_team = Team.new("Red")
red_team.add_players(player1, player2, player3, player4, player5, player6)  # (splat)

# select only players between 14 and 20 and reject any player below 4 skill-level

elig_players = red_team.select{|player| (14..22) === player.age}
                       .reject{|player| player.skill_level < 4}

puts elig_players
