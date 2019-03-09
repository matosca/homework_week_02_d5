class KaraokeRoom
  attr_reader :room_name, :booking_price, :capacity, :entry_fee
  attr_accessor :playlist

  def initialize(room_name, booking_price, playlist, capacity, entry_fee)
    @room_name = room_name
    @booking_price = booking_price
    @playlist = playlist
    @capacity = capacity
    @entry_fee = entry_fee
  end

  def check_in(guest, room)
    true if guest.wallet > room.booking_price
  end

  def check_out(guest, room)
    total = guest.wallet - room.booking_price
    return total
  end

  def add_song_to_room(new_song)
    @playlist.push(new_song)
  end

  def free_space?(guest, room)
    true if room.capacity != 0
    false
  end

  def pay_entry_fee(guest, room)
    total = room.check_out(guest, room)
    total -= room.entry_fee
    return total
  end
end
