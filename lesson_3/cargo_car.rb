# frozen_string_literal: true

class CargoCar < Car
  include Vendor

  def initialize(amount)
    @type = 'cargo'
    super
  end
end
