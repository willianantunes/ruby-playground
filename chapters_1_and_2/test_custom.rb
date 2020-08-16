require_relative 'custom'
# load 'custom.rb'
require "test/unit"

class MyVeryFirstHonestTest < Test::Unit::TestCase
  def test_simple
    self.assert_equal(212, convert_to_fahrenheit(100))
    assert_equal(212, convert_to_fahrenheit(100))
  end
end