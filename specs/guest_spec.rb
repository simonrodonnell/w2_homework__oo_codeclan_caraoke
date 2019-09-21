require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../guest")
require_relative("../song")
require_relative("../room")

class TestGuest < Minitest::Test

  def setup

    @song1 = Song.new("Like a Rolling Stone")
    @song2 = Song.new("I Will Survive")
    @song3 = Song.new("Smells Like Teen Spirit")
    @song4 = Song.new("Rapper's Delight")

    @songs = [@song1, @song2, @song3, @song4]

    @guest = Guest.new("Frank", 500, @song2.name)

    @room = Room.new(@songs, 4, 5)
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
    assert_equal("I love that song!", @guest.cheer(@room))
  end

  def test_pay_fee
    assert_equal(450, @guest.pay_fee(50))
  end

end
