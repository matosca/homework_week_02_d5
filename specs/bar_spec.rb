require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_rooms')
require_relative('../guests')
require_relative('../songs')
require_relative('../bar')
require_relative('../drinks')

class TestBar < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", 4)
    @drink4 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Cider", 3)

    @drinks = {
      "Beer" => [@drink1, @drink4], "Wine" => [@drink2], "Cider" => [@drink3]
    }

    @bar = Bar.new(100, @drinks)

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

  def test_bas_has_till_float
    assert_equal(100, @bar.till_float)
  end

  def test_bar_has_many_drinks
    assert_equal(@drinks, @bar.drinks)
  end

  def test_sell_drinks_to_guests__wallet_decreased
    result = @bar.sell_drink(@guest4, @drink1, @room3)
    assert_equal(21, result)
  end

  def test_sell_drinks_to_guests__till_increased
    result = @bar.total_till_float(@guest4, @drink1, @room3)
    assert_equal(149, result)
  end

  def test_stock_taking_of_drinks
    result = @bar.stock_taking("Cider")
    assert_equal(1, result)
  end
end
