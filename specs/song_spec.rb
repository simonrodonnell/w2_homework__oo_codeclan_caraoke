require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < Minitest::Test

  def test_song_has_name
    song = Song.new("Like a Rolling Stone", "Bob Dylan")
    assert_equal("Like a Rolling Stone", song.name())
  end

  def test_song_has_artist
    song = Song.new("Like a Rolling Stone", "Bob Dylan")
    assert_equal("Bob Dylan", song.artist())
  end

end
