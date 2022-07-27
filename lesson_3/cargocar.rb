class CargoCar < Car
  include Vendor

  def initialize
    @type = 'cargo'
  end
end
