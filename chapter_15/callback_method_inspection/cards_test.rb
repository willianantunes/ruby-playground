# Ruby ships with a testing framework called MiniTest.
# You use MiniTest by writing a class that inherits from the class MiniTest::Unit::TestCase and
# that contains methods whose names begin with the string test
require 'minitest/autorun'
require_relative 'cards'

class CardTest < MiniTest::Test
  # The method name setup is magic to MiniTest;
  # if defined, it’s executed before every test method in the test class
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

# The most striking thing about running this test file is that at no point do you have to
# instantiate the CardTest class or explicitly call the test methods or the setup method.
# Thanks to the loading of the autorun feature, MiniTest figures out that it’s supposed to run
# all the methods whose names begin with test, running the setup method before each of them.
