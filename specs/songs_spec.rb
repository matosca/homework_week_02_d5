require('minitest/autorun')
require('minitest/rg')
require_relative('../songs')

class TestSong < MiniTest::Test
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
  end

  def test_song_has_title
    assert_equal("We Will Rock You", @song4.song_title)
  end

  def test_song_has_bonus_points
    assert_equal(4, @song9.bonus)
  end

  def test_song_double_bonus_points
    assert_equal(10, @song2.double_bonus)
  end
end
