require_relative 'card'
require 'active_support/core_ext/array'

class Deck
  @full_deck = []

  class << self
    def deck_generate(player_num)
      create_full_deck
      deck_shuffle
      # 作成した山札を人数で分割するために、activesupportのメゾットを使用。
      @full_deck.in_groups(player_num,false)
    end

    def create_full_deck
      suit_array = %i[スペード ハート ダイヤ クラブ]
      rank_array = (2..14).to_a
      @full_deck = suit_array.product(rank_array).map { |suit,rank| Card.new(suit,rank) }
      @full_deck << Card.new(nil,15) # Jokerを追加
    end

    def deck_shuffle
      @full_deck.shuffle!.shuffle!
    end

    def deal_cards(player_decks,player_list)
      player_decks.each_with_index do |player_deck,i|
        player_list[i].deck = player_deck
      end
    end
  end
end