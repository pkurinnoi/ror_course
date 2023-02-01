# frozen_string_literal: true

class CargoCar < Car
  include Vendor
  include Accessors
  include Validation

  def initialize(amount)
    @type = 'cargo'
    super
  end
end
