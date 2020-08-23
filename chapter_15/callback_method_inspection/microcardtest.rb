require_relative 'microtest'
require_relative 'cards'

# MicroTest won’t supplant MiniTest any time soon,
# but it does do a couple of the most magical things that MiniTest does.
# It’s all made possible by Ruby’s introspection and callback facilities,
# techniques that put extraordinary power and flexibility in your hands.
class CardTest < MicroTest
  def setup
    @deck = PlayingCards::Deck.new
  end

  def test_deal_one
    @deck.deal
    assert_equal(51, @deck.size)
  end

  def test_deal_many
    @deck.deal(5)
    assert_equal(47, @deck.size)
  end
end
