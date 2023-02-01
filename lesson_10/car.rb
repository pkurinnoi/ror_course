# frozen_string_literal: true

class Car
  include Vendor
  include Accessors
  include Validation

  attr_reader :type, :qty, :free_amount
  attr_accessor :train, :car_num

  def initialize(amount)
    @train = nil
    @amount = amount
    @qty = 0
    @free_amount = amount
    @car_num = rand(16**amount).to_s(36)

    validate!
  end

  def in_train(train)
    @train = train
  end

  def qty_increase(quantity)
    if @qty + quantity <= @amount
      @qty += quantity
      @free_amount = @amount - @qty
    else
      puts 'No enought seats or space'
    end
  end

  def validate!
    raise 'Wrong car type!' if type != 'cargo' && type != 'pass'
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
