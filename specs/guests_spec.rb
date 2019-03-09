require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')
require_relative('../songs')
require_relative('../karaoke_rooms')

class TestGuest < MiniTest::Test
  def setup
    @guest1 = Guest.new("Jane", 50, "Crazy in Love", 0)
    @guest2 = Guest.new("Michael", 45, "Beat it", 0)
    @guest3 = Guest.new("Peter", 60, "We Will Rock You", 0)
    @guest4 = Guest.new("Walter", 70, "Get Lucky", 0)

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

    @room1 = KaraokeRoom.new("Sing City", 40, @songs, 5, 10)
    @room2 = KaraokeRoom.new("Pure Rock", 50, @songs, 3, 5)
    @room3 = KaraokeRoom.new("Medley Night", 30, @songs, 7, 15)
  end

  def test_guest_has_a_name
    assert_equal("Peter", @guest3.guest_name)
  end

  def test_total_money_in_wallet
    assert_equal(70, @guest4.wallet)
  end

  def test_guest_favourite_song__playing
    result = @guest3.play_guest_favourite_song(@guest3, @song4)
    assert_equal("Whooo!...rock youuuuuuu!", result)
  end

  def test_guest_favourite_song__not_playing
    result = @guest3.play_guest_favourite_song(@guest3, @song1)
    assert_equal("Turn it off", result)
  end

  def test_guest_score_per_song
    result = @guest1.score_per_song(@song5)
    assert_equal(8, result)
  end
end
