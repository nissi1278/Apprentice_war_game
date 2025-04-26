require 'minitest/autorun'
require_relative '../lib/Card'

class Cardtest < Minitest::Test
  def setup
    @joker = Card.new(nil,15)
    @card1 = Card.new(:スペード,13)
    @card2 = Card.new(:ダイヤ,3)
  end

  def test_joker?
    assert_predicate @joker, :joker?
  end

  def test_to_s
    assert_equal 'Joker', @joker.to_s
    assert_equal 'スペードのK', @card1.to_s
    assert_equal 'ダイヤの3', @card2.to_s
  end
end