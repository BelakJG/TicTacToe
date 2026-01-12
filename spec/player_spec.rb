require_relative '../lib/player'

describe Player do
  symbol = 'X'
  subject(:player) { described_class.new(symbol) }

  describe '#initialize' do
    it 'creates a new player object' do
      expect(player.instance_variable_get(:@symbol)).to eq(symbol)
    end
  end

  describe '#increase_score' do
    context 'when score amount is not given' do
      it 'increases score by 1' do
        expect { player.increase_score }.to change(player, :score).by(1)
      end
    end

    context 'when a score amount is given' do
      amount = 3
      it "increases the score by the set amount: (#{amount})" do
        expect { player.increase_score(amount) }.to change(player, :score).by(amount)
      end
    end
  end
end
