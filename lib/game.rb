require_relative 'board'
require_relative 'player'

class Game
  attr_reader :current_turn, :game_board, :player_one, :player_two, :winner

  def initialize
    @game_board = Board.new
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @current_turn = 'X'
  end

  def swap_turn
    @current_turn = current_turn == 'X' ? 'O' : 'X'
  end

  def display_game_state
    game_board.display_board
  end

  def play_round
    puts "Current turn is player #{current_turn}'s"
    display_game_state
    game_board.make_move(current_turn)
    swap_turn
  end

  def game_over?(board = @game_board.board)
    @winner = game_board.scan_all(board)
    @winner != ''
  end
end
