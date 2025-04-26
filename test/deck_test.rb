require 'minitest/autorun'
require_relative '../lib/Deck'

class Decktest < Minitest::Test
  def test_deck_generate_two_player
    # 53枚のカードから2人分のデッキが生成されているかをチェック
    hand_cards = Deck.deck_generate(2)

    assert_equal 2, hand_cards.size
    hand_cards.each do |deck|
      assert_includes (26..27), deck.size
    end
  end

  def test_deck_generate_five_player
    # 53枚のカードから5人分のデッキが生成されているかをチェック
    hand_cards = Deck.deck_generate(5)

    assert_equal 5, hand_cards.size
    hand_cards.each do |deck|
      assert_includes (10..11), deck.size
    end
  end
end