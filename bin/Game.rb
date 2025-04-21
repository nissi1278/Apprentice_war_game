require_relative '../lib/Deck'
require_relative '../lib/Player'

class Game
  @player_count = 2
  @player_decks = []

  class << self
    def create_users
      (1..@player_count).map do |count|
        puts "プレイヤー#{count}の名前を入力してください。"
        player_name = gets.to_s.chomp
        Player.new(count,player_name)
      end
    end

    def deal_cards(player_list)
      @player_decks = Deck.deck_generate(@player_count)
      @player_decks.each_with_index do |player_deck,i|
        player_list[i].player_deck = player_deck
      end
    end

    def main
      puts '戦争を開始します。'
      player_list = create_users
      deal_cards(player_list)
    end
  end
end

Game.main