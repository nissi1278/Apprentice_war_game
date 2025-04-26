require_relative '../lib/Deck'
require_relative '../lib/Player'

class Game
  def initialize
    @place_card = []
  end

  def game_start
    setup_game
    while all_players_have_cards?
      puts '戦争！'
      battle_card(@duel_player.map(&:play_card))
    end
    final_result
    puts "戦争を終了します。"
  end

  def battle_card(play_cards)
    ranks = play_cards.group_by { |p| p[:card].rank }
    max_rank = ranks.keys.max

    # スペードのAが場札にあるか判定
    win_players = spade_ace_player(ranks,max_rank) || ranks[max_rank]

    @place_card.concat(play_cards.map { |p| p[:card] }) # 引き分け用に場札を保持
    if draw?(win_players)
      battle_draw(win_players)
    else
      battle_win(win_players.first[:player])
    end
  end

  private

  def setup_game
    @player_list = create_players
    @duel_player = @player_list.dup
    player_decks = Deck.deck_generate(@player_count)
    Deck.deal_cards(player_decks,@player_list)
  end

  def create_players
    puts '戦争を開始します。プレイヤー人数を入力してください。(2~5)'
    @player_count = gets.chomp.to_i
    raise ArgumentError,'プレイヤー人数が2人〜5人でゲームを開始できます。' unless (2..5).cover?(@player_count)

    (1..@player_count).map { |num| create_player(num) }
  end

  def create_player(num)
    puts "プレイヤー#{num}の名前を入力してください。"
    player_name = gets.to_s.chomp
    player_name = "プレイヤー#{num}" if player_name.empty?
    Player.new(player_name)
  end

  def all_players_have_cards?
    @duel_player.all? { |p| p.deck_size.positive? }
  end

  def spade_ace_player(ranks,max_rank)
    if max_rank == 14
      spade_ace = ranks[14].select { |p| p[:card].spade_ace? }
      spade_ace.empty? ? nil : spade_ace
    end
  end

  def draw?(win_players)
    win_players.size > 1
  end

  def battle_draw(win_players)
    puts '引き分けです。'
    @duel_player = win_players.map { |p| p[:player] }
  end

  def battle_win(winner)
    puts "#{winner.name}が勝ちました。#{winner.name}はカードを#{@place_card.size}枚もらいました。"
    winner.add_deck_cards(@place_card)
    @place_card = []
    @duel_player = @player_list
  end

  def final_result
    player_rank_list = @player_list.sort_by { |p| -p.deck_size }

    puts @player_list.map { |p| "#{p.name}の手札の枚数は#{p.deck_size}枚です。" }.join("\n")
    puts player_rank_list.map.with_index(1) { |p,i| "#{i}位:#{p.name} " }.join("\n")
  end
end