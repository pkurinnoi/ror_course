class CargoCar < Car
  include Vendor

  def initialize(amount)
    @amount = amount
    @qty = 0
    @free_amount = amount
    @type = 'cargo'
  end
end
