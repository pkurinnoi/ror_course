class CargoCar < Car
  include Vendor

  def initialize(amount)
    @amount = amount
    @qty = 0
    @free_amount = amount
    @type = 'cargo'
    @@total_cars += 1
    @car_num = @@total_cars
  end
end
