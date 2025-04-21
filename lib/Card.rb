
class Card
  def initialize(suit,rank)
    @suit = suit
    @rank = rank
    @RANK_RABLE = { 11 => 'J',12 => 'Q', 13 => 'K', 14 => 'A', 15 => 'JOKER' }
  end
end