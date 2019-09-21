require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../room")
require_relative("../song")
require_relative("../guest")

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new("Like a Rolling Stone")
    @song2 = Song.new("I Will Survive")
    @song3 = Song.new("Smells Like Teen Spirit")
    @song4 = Song.new("Rapper's Delight")

    @new_song = Song.new("Paranoid")

    @songs = [@song1, @song2, @song3, @song4]

    @guest1 = Guest.new("Frank", 50, @song3)
    @guest2 = Guest.new("Bob", 100, @song2)
    @guest3 = Guest.new("Joe", 33, @song1)

    @new_guest = Guest.new("Alice", 20, @song1)
    @new_guest2 = Guest.new("Emma", 10, @new_song)

    @guests = [@guest1, @guest2, @guest3]

    @room = Room.new(@songs, 4, 5)
  end

  def test_room_has_guests
    @room.check_guest_in(@guest1)
    @room.check_guest_in(@guest2)
    @room.check_guest_in(@guest3)
    assert_equal(3, @room.guests().length())
  end

  def test_room_has_songs
    assert_equal(4, @room.songs().length())
  end

  def test_room_has_playlist
    assert_equal(["Like a Rolling Stone",
    "I Will Survive",
    "Smells Like Teen Spirit",
    "Rapper's Delight"], @room.playlist)
  end

  def test_room_has_capacity
    assert_equal(4, @room.capacity)
  end

  def test_check_guest_in
    @room.check_guest_in(@new_guest)
    assert_equal(1, @room.guests().length())
  end

  def test_check_guest_out
    @room.check_guest_in(@guest1)
    @room.check_guest_in(@guest2)
    @room.check_guest_in(@guest3)
    @room.check_guest_out(@guest3)
    assert_equal(2, @room.guests().length())
  end

  def test_add_song_to_room
    @room.add_song(@new_song)
    assert_equal(5, @room.songs().length())
  end

  def test_add_duplicate_song_to_room
    @room.add_song(@song1)
    assert_equal(4, @room.songs().length())
  end

  def test_room_has_reached_capacity
    @room.check_guest_in(@guest1)
    @room.check_guest_in(@guest2)
    @room.check_guest_in(@guest3)
    @room.check_guest_in(@new_guest)
    @room.check_guest_in(@new_guest2)
    assert_equal(true, @room.has_reached_capacity())
    assert_equal(4, @room.guests().length())
  end

  def test_room_has_fee__can_pay
    @room.check_guest_in(@guest1)
    @room.check_guest_in(@guest2)
    @room.check_guest_in(@guest3)
    @room.collect_fee
    guests_money = @guests.map { |guest| guest.money() }
    assert_equal([45, 95, 28], guests_money)
  end

  def test_room_has_fee__cannot_pay
    @room.check_guest_in(@guest1)
    @room.check_guest_in(@guest2)
    @room.check_guest_in(@guest3)
    @room.collect_fee(34)
    assert_equal(2, @room.guests().length())
    assert_equal(68, @room.money)
  end
end
