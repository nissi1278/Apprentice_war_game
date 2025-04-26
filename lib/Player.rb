# require_relative ''

class Player
  attr_accessor :name, :deck

  def initialize(name)
    @name = name
    @deck = []
  end

  def play_card
    card = @deck.first
    puts "#{@name}のカードは#{card.to_s}"
    @deck.delete_at(0)
    { player: self,card: card }
  end

  def add_deck_cards(place_card)
    @deck.concat(place_card)
  end

  def deck_size
    deck.size
  end
end
