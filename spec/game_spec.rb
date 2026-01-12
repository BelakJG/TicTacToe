require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#initialize' do
    context 'when a new game is started' do
      it 'creates a game board' do
        expect(game.instance_variable_get(:@game_board)).not_to be_nil
      end

      it 'creates two players' do
        player_one = game.instance_variable_get(:@player_one)
        player_two = game.instance_variable_get(:@player_two)
        expect(player_one).not_to be_nil
        expect(player_two).not_to be_nil
      end

      it 'sets turn to player X' do
        expect(game.instance_variable_get(:@current_turn)).to eq('X')
      end
    end
  end

  describe '#swap_turn' do
    context 'when turn is passed' do
      it 'swaps to O if it came from X' do
        expect { game.swap_turn }.to change(game, :current_turn).to 'O'
      end

      it 'swaps to X if it came from O' do
        game.instance_variable_set(:@current_turn, 'O')
        expect { game.swap_turn }.to change(game, :current_turn).to 'X'
      end
    end
  end

  describe '#game_over?' do
    over = %w[X X X 3 4 5 6 7 8]
    context 'when board is scanned' do
      it 'returns true if game is over' do
        expect(game.game_over?(over)).to be(true)
      end

      it 'returns false if game is not over' do
        expect(game).not_to be_game_over
      end
    end
  end
end
