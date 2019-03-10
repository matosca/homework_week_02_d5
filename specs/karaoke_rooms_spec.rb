require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_rooms')
require_relative('../guests')
require_relative('../songs')

class TestKaraokeRoom < MiniTest::Test
  def setup

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

    @group = [@guest1, @guest2, @guest3, @guest4]
  end

  def test_get_name_of_karaoke_room
    assert_equal("Sing City", @room1.room_name)
  end

  def test_room_booking_price
    assert_equal(50, @room2.booking_price)
  end

  def test_room_has_a_playlist
    assert_equal(@songs, @room3.playlist)
  end

  def test_guest_check_in
    result = @room3.check_in(@guest2, @room3)
    assert_equal(true, result)
  end

  def test_guest_check_out
    result = @room1.check_out(@guest1, @room1)
    assert_equal(10, result)
  end

  def test_add_song_to_room
    @song10 = Song.new("Bohemian Rhapsody", 7)
    @room3.add_song_to_room(@song10)
    assert_equal(10, @room3.playlist.length())
  end

  def test_capacity_of_rooms
    assert_equal(7, @room3.capacity)
  end

  def test_is_there_free_space__available
    @room2.free_space?(@guest1, @room2)
    assert_equal(true, @room2.check_in(@guest1, @room1))
  end

  def test_is_there_free_space__not_available
    result = @room1.free_space?(@group, @room1)
    assert_equal(false, result)
  end

  def test_pay_fee_for_entry
    result = @room2.pay_entry_fee(@guest4, @room2)
    assert_equal(15, result)
  end
end
