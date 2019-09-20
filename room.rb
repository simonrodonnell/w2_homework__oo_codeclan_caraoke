class Room
  attr_reader(:capacity, :fee, :money)

  def initialize(songs, capacity, fee)
    @songs = songs
    @guests = []
    @capacity = capacity
    @fee = fee
    @money = 0
  end

  def songs()
    return @songs
  end

  def guests()
    return @guests
  end

  def check_guest_in(new_guest)
    @guests << new_guest if has_reached_capacity == false
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song if @songs.include?(song) == false
  end

  def has_reached_capacity
    return @guests.length() == @capacity
  end

  def collect_fee
    remove_guests = []
    for guest in @guests
      if guest.money >= @fee
        guest.pay_fee(@fee)
      else
        remove_guests.push(guest)
      end
    end
    for guest in @guests
      if remove_guests.include?(guest)
        @guests.delete(guest)
      end
    end
    # @guests.each { |guest| guest.pay_fee(@fee) }
  end

end
