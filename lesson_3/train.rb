class Train
  include Vendor

  attr_reader :train_num
  attr_reader :type
  attr_reader :carsname
  attr_reader :speed

  attr_accessor :current_station

  @@all_trains = []

  NUM = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/

  def initialize
    validate!
  end

  def add_to_list
    @@all_trains << self
  end

  def self.find(train_num)
    @@all_trains.filter { |obj| obj.train_num == train_num }
  end

  def car_add(car) # используется напрямую снаружи класса
      if car.type == self.type && car.train.nil? && @speed == 0
        @cars << car
        car.train = self
        puts "Car #{car} successfully added to the train #{self.train_num}"
      elsif car.train != nil
        puts "Car already in train #{car.train.train_num}"
      elsif car.type != self.type
        puts "Can't add #{car.type} car to the #{self.type} train"
      elsif @speed != 0
        puts "Train on a go. Can't change the cars! Stop the train first"
      end
  end

  def car_remove(car)
    if car.train == self && @speed == 0
      @cars.delete(car)
      car.train = nil
      puts "Car #{car} successfully removed from the train #{self.train_num}"
    elsif @speed != 0
      puts "Train on a go. Can't change the cars! Stop the train first"
    else
      puts "Car #{car} is not in #{self.train_num}"
    end
  end

  def get_route(map) # используется напрямую снаружи класса
    @current_route = map
    @current_route.start_station.train_arrival(self)
    @current_station = @current_route.start_station
  end

  def move(direction) # используется напрямую снаружи класса
    directions = ['fwd','back']
    raise "Error: type must be 'fwd' or 'back'" unless directions.include?(direction)

    if direction == 'fwd' && @current_station != @current_route.route[-1]
      @current_station.train_departure(self)
      @speed = 200
      @current_station = next_station
      @current_station.train_arrival(self)
      stop
    elsif direction == 'back' && @current_station != @current_route.route[0]
      @current_station.train_departure(self)
      @speed = 200
      @current_station = prev_station
      @current_station.train_arrival(self)
      stop
    end
    puts "Train on the station #{current_station.name}"
  end

  def prev_station # используется напрямую снаружи класса
    station_num = @current_route.route.find_index(@current_station)

    if station_num > 0
      @current_route.route[station_num - 1]
    end
  end

  def next_station # используется напрямую снаружи
    station_num = @current_route.route.find_index(@current_station)

    if station_num < @current_route.route.size() - 1
      @current_route.route[station_num + 1]
    end
  end

  def validate!
    raise "Wrong train number!" if @train_num !~ NUM
    raise "Wrong type!" if (@type != 'cargo' || @type != 'pass')
    raise "Train speed must be '0'!" if @speed != 0
    raise "Wrong number of cars!" if @cars.any?
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def set_speed(speed) # используется только внутри класса и подклассами - private
    @speed = speed
  end

  def stop # используется только внутри класса и подклассами - private
    @speed = 0
  end
end
