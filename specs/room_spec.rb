require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../song")
require_relative("../guest")

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new("Like a Rolling Stone")
    @song2 = Song.new("I Will Survive")
    @song3 = Song.new("Smells Like Teen Spirit")
    @song4 = Song.new("Rapper's Delight")

    @songs = [@song1, @song2, @song3, @song4]

    @guest1 = Guest.new("Frank", 50, @song3)
    @guest2 = Guest.new("Bob", 100, @song2)
    @guest3 = Guest.new("Joe", 33, @song1)

    @new_guest = Guest.new("Alice", 20, @song1)

    @guests = [@guest1, @guest2, @guest3]

    @room = Room.new(@songs, @guests, 3)
  end

  def test_room_has_guests
    assert_equal(3, @room.guests().length())
  end

  def test_room_has_songs
    assert_equal(4, @room.songs().length())
  end

  def test_room_has_capacity
    assert_equal(3, @room.capacity)
  end

end
