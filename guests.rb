class Guest

  attr_reader :guest_name, :favourite_song

  def initialize(guest_name, wallet, favourite_song, score)
    @guest_name = guest_name
    @wallet = wallet
    @favourite_song = favourite_song
    @score = score
  end

  def wallet
    return @wallet
  end

  def play_guest_favourite_song(guest, song)
    return "Whooo!...rock youuuuuuu!" if song.song_title == guest.favourite_song
    return "Turn it off"
  end

  def score_per_song(song)
    @score += song.bonus
  end
end
