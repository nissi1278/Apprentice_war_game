require 'minitest/autorun'
require_relative '../lib/Player'
require_relative '../lib/Card'

class Playertest < Minitest::Test
  def setup
    @card1 = Card.new(:クラブ,13)
    @card2 = Card.new(:ダイヤ,3)
    @card3 = Card.new(nil,15)
    @player = Player.new('test user')
    @player.deck = [@card1]
  end

  def test_play_card
    place_card = @player.play_card

    assert_equal @player, place_card[:player]
    assert_equal @card1, place_card[:card]
    assert_equal 0, @player.deck_size
  end

  def test_add_deck_cards
    @player.add_deck_cards([@card2,@card3])

    assert_equal 3, @player.deck_size
  end
end