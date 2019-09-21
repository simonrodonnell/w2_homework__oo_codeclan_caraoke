class Guest
  attr_reader(:name, :favourite_song, :has_paid)
  attr_accessor(:money)
  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
    @has_paid = false
  end

  def cheer(room)
    if room.playlist.include?(@favourite_song)
      return "I love that song!"
    else
      return "Meh. This place sucks."
    end
  end

  def pay_fee(amount)
    @money -= amount
    @has_paid = true
  end
end
