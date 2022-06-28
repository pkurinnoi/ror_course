class Train
  def initialize(train_num, type, car_num, speed = 0)
    @train_num = train_num
    @car_num = car_num
    @type = type
    @speed = speed
    types = ['pass','cargo']
    raise "Error: type must be 'pass' or 'cargo'" unless types.include?(type)
  end

  def num
    @train_num
  end

  def type
    @type
  end

  def set_speed(speed)
    @speed = speed
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def car_num
    @car_num
  end

  def cars_change(cars)
    if @speed == 0
      if cars > 0
        @car_num += 1
      else
        @car_num -= 1
      end
    else
      puts "Train on a go. Can't change the cars! Stop the train first"
    end
  end

  def route

  end
end
