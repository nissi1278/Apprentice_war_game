class Card
  attr_reader :suit, :rank

  RANK_LABEL = { 11 => 'J',12 => 'Q', 13 => 'K', 14 => 'A', 15 => 'JOKER' }.freeze

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end

  def rank_name
    RANK_LABEL[@rank] || @rank.to_s
  end

  def joker?
    rank == 15
  end

  def spade_ace?
    @suit == :スペード && @rank = 14
  end

  def to_s
    joker? ? 'Joker' : "#{@suit}の#{rank_name}"
  end
end