class Car
  include Vendor

  attr_reader :type
  attr_accessor :train
  attr_reader :qty
  attr_reader :free_amount

  def initialize
    @train = nil
    validate!
  end

  def in_train(train)
    @train = train
  end

  def qty_increase(quantity)
      if (@qty + quantity) <= @amount
      @qty += quantity
      @free_amount = @amount - @qty
      else
        puts "No enought seats or space"
      end
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
