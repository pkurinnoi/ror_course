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

  def get_route(map)
    @current_route = map.route
    @station_num = 0
    @current_station = @current_route[@station_num]
  end

  def move(direction)
    directions = ['fwd','back']
    raise "Error: type must be 'fwd' or 'back'" unless directions.include?(direction)
    if direction == 'fwd' && @station_num < @current_route.size - 1
      @station_num += 1
      @current_station = @current_route[@station_num]
    elsif direction == 'back' && @station_num > 0
      @station_num -= 1
      @current_station = @current_route[@station_num]
    else
      @current_station
    end
  end

  def route
    if @station_num == 0
      { 'Curr' => @current_station, 'Next' => @current_route[@station_num + 1] }
    elsif @station_num < @current_route.size - 1 && @station_num > 0
      { 'Prev' => @current_route[@station_num - 1], 'Curr' => @current_station, 'Next' => @current_route[@station_num + 1] }
    else
      { 'Prev' => @current_route[@station_num - 1], 'Curr' => @current_station }
    end
  end
end
