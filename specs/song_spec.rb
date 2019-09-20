require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < Minitest::Test

def test_song_has_name
  song = Song.new("Like a Rolling Stone")
  assert_equal("Like a Rolling Stone", song.name())
end

end
