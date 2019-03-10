class Bar

  attr_reader :till_float, :drinks

  def initialize(till_float, drinks)
    @till_float = till_float
    @drinks = drinks
  end

  def sell_drink(guest, drink, room)
    total = (room.check_out(guest, room)) && (room.pay_entry_fee(guest, room))
    total -= drink.price
  end

  def total_till_float(guest, drink, room)
    total_room_cost = room.booking_price + room.entry_fee
    total_costs = total_room_cost + drink.price
    @till_float += total_costs
  end

  def stock_taking(drink)
    return @drinks[drink].count()
  end

end
