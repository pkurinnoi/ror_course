class Car
  include Vendor

  attr_reader :type
  attr_accessor :train

  def initialize
    @train = nil
    validate!
  end

  def in_train(train)
    @train = train
  end

  def validate!
    raise "Wrong car type!" if (self.type != 'cargo' && self.type != 'pass')
  end

  def valid?
    validate!
    true
  rescue
    false
  end
end
