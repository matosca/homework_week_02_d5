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

  def win_score(song)
    @score += song.bonus
  end
  def lose_score(song)
    @score -= song.bonus
  end

  def win_double_bonus(guest, song)
    @score += song.double_bonus if guest.play_guest_favourite_song(guest, song)
  end

  def lose_double_bonus(guest, song)
    @score -= song.double_bonus if guest.play_guest_favourite_song(guest, song)
  end

  def score_to_zero(guest, song, screen)
    return screen.game_over if guest.lose_score(song)
  end
end
