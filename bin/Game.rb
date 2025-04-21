require_relative '../lib/Deck'
require_relative '../lib/Player'

class Game
  def initialize
    @player_count = 2
  end

  def create_users
    (1..@player_count).map do |count|
      puts "プレイヤー#{count}の名前を入力してください。"
      player_name = gets.to_s.chomp
      Playe.new(count,player_name)
    end
  end

  def deal_cards
    @player_decks = deck_generate(@player_count)
  end

  def main
    puts '戦争を開始します。'
  end
end