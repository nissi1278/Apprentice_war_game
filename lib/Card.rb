class Card
  # カードも絵柄も比較する可能性を考慮し、数値で保持。出力する際に、文字に変換する。
  RANK_LABEL = { 11 => 'J',12 => 'Q', 13 => 'K', 14 => 'A', 15 => 'JOKER' }.freeze
  SUIT_LABEL = { 1 => 'スペード',2 => 'ハート', 3 => 'ダイヤ', 4 => 'クラブ' }.freeze

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end
end