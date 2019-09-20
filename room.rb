class Room
  attr_reader(:capacity)

  def initialize(songs, guests, capacity)
    @songs = songs
    @guests = guests
    @capacity = capacity
  end

  def songs()
    return @songs
  end

  def guests()
    return @guests
  end

end
