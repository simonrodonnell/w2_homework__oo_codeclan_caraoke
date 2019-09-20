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

  def check_guest_in(new_guest)
    @guests << new_guest
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

end
