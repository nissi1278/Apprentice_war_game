# require_relative ''

class Player
  attr_accessor :name, :deck, :hand

  def initialize(name)
    @name = name
    @deck = []
    # 勝った際は場札のカードではなく枚数を保持する。
    @hand = 0
  end

  def play_card
    card = @deck.first
    puts "#{@name}のカードは#{card.to_s}"
    @deck.delete_at(0)
    { player: self,card: card }
  end
end