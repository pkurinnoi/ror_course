# frozen_string_literal: true

class CargoCar < Car
  include Vendor
  include Accessors

  def initialize(amount)
    @type = 'cargo'
    super
  end
end
