class Player
  attr_reader :symbol, :score

  def initialize(symbol)
    @symbol = symbol
    @score = 0
  end

  def increase_score(amount = 1)
    @score += amount
  end
end
