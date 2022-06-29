class Train
  attr_reader :train_num
  attr_reader :type
  attr_reader :car_num
  attr_reader :speed

  attr_accessor :current_station

  def initialize(train_num, type, car_num, speed = 0)
    @train_num = train_num
    @car_num = car_num
    @type = type
    @speed = speed
    types = ['pass','cargo']
    raise "Error: type must be 'pass' or 'cargo'" unless types.include?(type)
  end

  def set_speed(speed)
    @speed = speed
  end

  def stop
    @speed = 0
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
    @current_route = map
    @current_route.start_station.train_arrival(self)
    @current_station = @current_route.start_station
  end

  def move(direction)
    directions = ['fwd','back']
    raise "Error: type must be 'fwd' or 'back'" unless directions.include?(direction)
    #TODO (вероятно надо через методы станций ниже)
    end
  end

  def route
    #TODO наверное надо делать отдельные методы для каждой станции (предыдущая и следующая)
    end
  end
end
