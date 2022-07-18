class PassCar
  attr_reader :type
  attr_accessor :train

  def initialize
    @train = nil
  end

  def type
    @type = 'pass'
  end

  def in_train(train)
    @train = train
  end
end
