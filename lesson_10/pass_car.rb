# frozen_string_literal: true

class PassCar < Car
  include Vendor
  include Accessors
  include Validation

  def initialize(amount)
    @type = 'pass'
    super
  end
end
