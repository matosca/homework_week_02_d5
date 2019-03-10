class Screen

  attr_reader :status

  def initialize(status)
    @status = status
  end

  def display_new_song(screen, song, room)
    if screen.status == true
      room.play_song(song)
    else
      return "Out of service"
    end
  end

  def game_over
    return "GAME OVER"
  end
end
