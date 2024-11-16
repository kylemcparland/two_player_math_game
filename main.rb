require "./game"
require "./player"
require "./math_checker"
require "./random_number"

# INITIALIZE BOTH PLAYERS...
player_1 = Player.new
player_2 = Player.new

# INITIALIZE HELPERS...
random_number = Random_number.new
math_checker = Math_checker.new

# CREATE NEW GAME...
current_game = Game.new

# <==========================> #

# GAME START!
while player_1.lives > 0 && player_2.lives > 0

  # GENERATE QUESTION:
  num_1 = random_number.generate_random_number
  num_2 = random_number.generate_random_number

  # ASK QUESTION:
  puts "Player #{current_game.current_player}: What is #{num_1} + #{num_2}?"
  answer = gets.chomp.to_i

  # PROCESS ANSWER:
  processed_answer = math_checker.sum_two(num_1, num_2, answer)
  if (processed_answer == true) 
    puts "✅ YES! You are correct. ✅"
   else 
    puts "❌ Seriously? No! ❌"
    current_game.current_player == 1 ? player_1.lose_life() : player_2.lose_life()
   end

   current_game.pause_terminal

  #  DISPLAY CURRENT SCORE:
  puts "P1: #{player_1.lives}/3 vs P2: #{player_2.lives}/3"

  # CHANGE PLAYER AND START NEW TURN:
   if (player_1.lives == 0 || player_2.lives == 0)
    puts "----- GAME OVER -----"
   else
    puts "----- NEW TURN -----"
    current_game.change_player
   end
end

# PROCESS GAME OVER...
if player_1.lives == 0
  puts "Player 1 loses."
else
  puts "Player 2 loses."
end