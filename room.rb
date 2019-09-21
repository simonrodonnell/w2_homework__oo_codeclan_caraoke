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

  def playlist()
    playlist = @songs.map { |song| song.name }
    return playlist
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

  def collect_fee(amount = @fee)
    not_enough_money_guests = []
    @guests.each do |guest|
      if guest.money >= amount
        guest.pay_fee(amount)
        @money += amount
      else
        not_enough_money_guests.push(guest)
      end
    end
    @guests.each do |guest|
      @guests.delete(guest) if not_enough_money_guests.include?(guest)
    end

  end

end
