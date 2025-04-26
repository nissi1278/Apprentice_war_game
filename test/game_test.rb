require 'minitest/autorun'
require_relative '../lib/Card'
require_relative '../lib/Player'
require_relative '../lib/Game'

class Decktest < Minitest::Test
  def setup
    @players = [Player.new('たろう'),Player.new('じろう'),Player.new('さぶろう')]
    @game = Game.new
  end

  def build_test_play_cards(card_list)
    card_list.each_with_index do |card,i|
      @players[i].deck = [card]
    end
    @players.map(&:play_card)
  end

  def test_battle_card_draw
    play_cards = build_test_play_cards([Card.new(:クラブ,10),Card.new(:ハート,9),Card.new(:ハート,10)])
    duel_player = @game.battle_card(play_cards)

    assert_equal 2, duel_player.size
    assert_equal 'たろう', duel_player[0].name
    assert_equal 'さぶろう', duel_player[1].name
  end

  def test_battle_card_win
    play_cards = build_test_play_cards([Card.new(:ハート,9),Card.new(:nil,15),Card.new(:ハート,10)])
    @game.battle_card(play_cards)

    assert_equal 0, play_cards[0][:player].deck_size
    assert_equal 3, play_cards[1][:player].deck_size
    assert_equal 0, play_cards[2][:player].deck_size
  end

  def test_battle_card_spade_ace
    # 世界一ルールのテスト
    play_cards = build_test_play_cards([Card.new(:スペード,14),Card.new(:ダイヤ,14),Card.new(:ハート,14)])
    @game.battle_card(play_cards)

    assert_equal 3, play_cards[0][:player].deck_size
    assert_equal 0, play_cards[1][:player].deck_size
    assert_equal 0, play_cards[2][:player].deck_size
  end
end