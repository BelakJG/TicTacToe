class Board
  attr_reader :board

  def initialize
    @board = []
    0.upto(8) do |n|
      board[n] = n
    end
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '---|---|---'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '---|---|---'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def make_move(symbol)
    valid = false
    puts "player #{symbol}, please select a position:"
    until valid
      index = gets.chomp.to_i
      if board[index] == index
        valid = true
      else
        display_board
        puts 'Error: Please select a valid position'
      end
    end
    board[index] = symbol
  end

  def scan_rows(board = @board)
    if board[0] == board[1] && board[0] == board[2]
      board[0]
    elsif board[3] == board[4] && board[3] == board[5]
      board[3]
    elsif board[6] == board[7] && board[6] == board[8]
      board[6]
    else
      ''
    end
  end

  def scan_cols(board = @board)
    if board[0] == board[3] && board[0] == board[6]
      board[0]
    elsif board[1] == board[4] && board[1] == board[7]
      board[1]
    elsif board[2] == board[5] && board[2] == board[8]
      board[2]
    else
      ''
    end
  end

  def scan_diags(board = @board)
    if board[0] == board[4] && board[0] == board[8]
      board[0]
    elsif board[2] == board[4] && board[2] == board[6]
      board[2]
    else
      ''
    end
  end

  def scan_all(board = @board)
    scan_cols(board) + scan_diags(board) + scan_rows(board)
  end
end
