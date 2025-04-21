require 'minitest/autorun'
require_relative '../lib/Deck'

class Decktest < Minitest::Test
  def setup
    @deck = Deck.new
  end

  def test_deck_generate_two_player
    # 52枚のカードから2人分のデッキが生成されているかをチェック
    hand_cards = @deck.deck_generate(2)

    assert_equal 2, hand_cards.size
    hand_cards.each do |deck|
      assert_equal 26, deck.size
    end
  end
end
