require_relative '../lib/Deck'
require_relative '../lib/Player'

class Game
  def initialize
    # カードを出すプレイヤーリストは引き分け時の再戦用に別管理とする。
    @player_list = create_users
    @duel_player = @player_list.dup
    player_decks = Deck.deck_generate(@player_count)
    Deck.deal_cards(player_decks,@player_list)
    @place_card_count = 0
  end

  def create_users
    puts '戦争を開始します。プレイヤー人数を入力してください。(2~5)'
    @player_count = gets.chomp.to_i
    raise ArgumentError,'プレイヤー人数が2人〜5人でゲームを開始できます。' unless (2..5).cover?(@player_count)

    (1..@player_count).map do |num|
      puts "プレイヤー#{num}の名前を入力してください。"
      player_name = gets.to_s.chomp || "プレイヤー#{num}"
      Player.new(player_name)
    end
  end

  def all_players_have_cards?
    @duel_player.all? { |player| player.deck.size.positive? }
  end

  def battle_card(place_card)
    max_rank = place_card.map { |p| p[:card].rank }.max
    win_players = place_card.select { |p| p[:card].rank == max_rank }

    @place_card_count += place_card.size
    if win_players.size > 1
      puts '引き分けです。'
      # 引き分けの場合、引き分けた人のみ再デュエル
      @duel_player = win_players.map { |p| p[:player] }
    else
      winner = win_players.first[:player]
      puts "#{winner.name}が勝ちました。#{winner.name}はカードを#{@place_card_count}枚もらいました。"
      winner.add_hand_cards(@place_card_count)
      @duel_player = @player_list
      @place_card_count = 0
    end
  end

  def final_winner
    @player_list.max_by { |player| player.hand }
  end

  def game_start
    while all_players_have_cards?
      puts '戦争！'
      battle_card(@duel_player.map(&:play_card))
    end
    final_winner
  end
end