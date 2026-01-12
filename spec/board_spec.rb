require_relative '../lib/board'

describe Board do
  subject(:game_board) { described_class.new }

  describe '#initialize' do
    context 'when a new board object is created' do
      it 'creates an array containing integers' do
        expect(game_board.instance_variable_get(:@board)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
      end
    end
  end

  describe '#make_move' do
    context 'when player picks a valid location' do
      position = '3'
      before do
        allow(game_board).to receive(:gets).and_return(position)
        allow(game_board).to receive(:puts)
      end

      it 'places symbol in specified location' do
        player = 'X'
        board = game_board.instance_variable_get(:@board)
        expect { game_board.make_move(player) }.to change { board[position.to_i] }.to(player)
      end
    end

    context 'when player inputs an incorrect location' do
      error = 'Error: Please select a valid position'
      before do
        allow(game_board).to receive(:gets).and_return('12', '3')
      end

      it 'loops and displays an error' do
        expect { game_board.make_move('X') }.to output(/#{error}/).to_stdout
      end
    end
  end
end
