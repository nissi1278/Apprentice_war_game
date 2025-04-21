# require_relative ''

class Player
  def initialize(num,name)
    @player_num = num
    @player_name = name
    @player_deck = []
    @player_hand = []
  end
end