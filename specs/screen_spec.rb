require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_rooms')
require_relative('../guests')
require_relative('../songs')
require_relative('../screen')

class TestScreen < MiniTest::Test
  def setup
    @screen1 = Screen.new(true)
    @screen2 = Screen.new(false)

    @song1 = Song.new("Sweet Child O' Mine", 3)
    @song2 = Song.new("Eye of the Tiger", 5)
    @song3 = Song.new("Beat it", 2)
    @song4 = Song.new("We Will Rock You", 9)
    @song5 = Song.new("Hips Don't Lie", 8)
    @song6 = Song.new("Mr. Brightside", 6)
    @song7 = Song.new("Crazy in Love", 1)
    @song8 = Song.new("Get Lucky", 7)
    @song9 = Song.new("Wake Me Up",4)

    @songs = [@song1, @song2, @song3, @song4, @song5, @song6, @song7, @song8, @song9]

    @room1 = KaraokeRoom.new("Sing City", 40, @songs, 0, 10)
    @room2 = KaraokeRoom.new("Pure Rock", 50, @songs, 3, 5)
    @room3 = KaraokeRoom.new("Medley Night", 30, @songs, 7, 15)

    @guest1 = Guest.new("Jane", 50, "Crazy in Love", 0)
    @guest2 = Guest.new("Michael", 45, "Beat it", 10)
    @guest3 = Guest.new("Peter", 60, "We Will Rock You", 6)
    @guest4 = Guest.new("Walter", 70, "Get Lucky", 15)
  end

  def test_screen_status__on
    assert_equal(true, @screen1.status)
  end

  def test_screen_status__off
    assert_equal(false, @screen2.status)
  end

  def test_start_karaoke_mode__on
    result = @screen1.display_new_song(@screen1, @song2, @room2)
    assert_equal("Nanana nana ...Eye of the Tiger", result )
  end
  def test_start_karaoke_mode__off
    result = @screen2.display_new_song(@screen2, @song2, @room2)
    assert_equal("Out of service", result )
  end

  def test_karaoke_game_over
    assert_equal("GAME OVER", @screen1.game_over)
  end
end
