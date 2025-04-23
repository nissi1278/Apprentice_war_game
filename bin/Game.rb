require_relative '../lib/Deck'
require_relative '../lib/Player'

class Game
  @player_count = 3
  @player_decks = []
  @player_list = []
  
  class << self
    def create_users
      (1..@player_count).map do
        puts "プレイヤー#{count}の名前を入力してください。"
        player_name = gets.to_s.chomp
        Player.new(player_name)
      end
    end

    def deal_cards
      @player_decks = Deck.deck_generate(@player_count)
      @player_decks.each_with_index do |player_deck,i|
        @player_list[i].deck = player_deck
      end
    end

    def all_players_have_cards?
      # 各ユーザの手札が0枚かチェック
      @duel_player.all? { |player| player.deck.size > 0 }
    end

    def battle_card(place_card)
      win_players = place_card.max_by do |player|
        player[:card].rank
      end
      puts "引き分けチェック:#{win_players.size}"

      if win_players.size > 2
        puts '引き分けです。'
        # 引き分けの場合、引き分けた人のみ再デュエル
        @duel_player = win_players
      else
        winner = win_players[:player]
        puts "#{winner.name}の勝ち！"
        winner.hand += place_card.size
        @duel_player = @player_list
      end
    end

    def final_winner
      @player_list.max_by { |player| player.hand}
    end

    def main
      puts '戦争を開始します。プレイヤー人数を入力してください。'
      @player_count = gets.to_i
      raise ArgumentError ,'プレイヤー人数が2人〜5人でゲームを開始できます。' unless (2..5).include?(@player_count) 

      @duel_player = @player_list = create_users
      deal_cards
      while all_players_have_cards?
        puts '戦争！'
        place_card = @duel_player.map(&:play_card)
        battle_card(place_card)
      end
      final_winner
    end
  end
end

Game.main