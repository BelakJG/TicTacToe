require_relative 'lib/game'

play_again = true
while play_again
  tic_tac_toe = Game.new
  tic_tac_toe.play_round until tic_tac_toe.game_over?
  tic_tac_toe.display_game_state
  puts "Game over! The winner is player #{tic_tac_toe.winner}!"
  puts 'Play again? Y or N'
  play_again = gets.chomp.upcase == 'Y'
end
