class CargoCar
  include Vendor

  attr_reader :type
  attr_accessor :train

  def initialize
    @train = nil
    @type = 'cargo'
    validate!
  end

  def in_train(train)
    @train = train
  end

  def validate!
    raise "Wrong car class!" if self.type != 'cargo'
  end

  def valid?
    validate!
    true
  rescue
    false
  end
end
