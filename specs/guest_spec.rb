require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")

class TestGuest < Minitest::Test

  def setup
    @song = Song.new("I Will Survive")
    @guest = Guest.new("Frank", 500, @song.name)
  end

  def test_guest_has_name
    assert_equal("Frank", @guest.name())
  end

  def test_guest_has_money
    assert_equal(500, @guest.money())
  end

  def test_guest_has_favourite_song
    assert_equal("I Will Survive", @guest.favourite_song())
  end

  def test_guest_cheer
    assert_equal("I love that song!", @guest.cheer())
  end

  def test_pay_fee
    assert_equal(450, @guest.pay_fee(50))
  end

end
