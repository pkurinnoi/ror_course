# frozen_string_literal: true

class PassCar < Car
  include Vendor

  def initialize(amount)
    @type = 'pass'
    super
  end
end
