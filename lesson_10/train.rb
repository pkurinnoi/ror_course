# frozen_string_literal: true

class Train
  include TrainMove
  include Accessors
  include Validation

  class << self
    attr_accessor :all_trains
  end

  include Vendor

  attr_reader :train_num, :type, :speed, :cars

  attr_accessor :current_station

  NUM = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/.freeze

  validate :num, :presence
  validate :num, :type
  validate :num, :format, NUM

  Train.all_trains = []

  def initialize(train_num, speed = 0)
    @train_num = train_num
    @speed = speed
    @cars = []

    validate!
  end

  def check(&block)
    @cars.each(&block)
  end

  def add_to_list
    Train.all_trains << self
  end

  def self.find(train_num)
    Train.all_trains.filter { |obj| obj.train_num == train_num }
  end

  # кроме методов, которые и должны что-то выводить на экран. выводим подсказки
  def car_add(car)
    if car.type == type && car.train.nil? && @speed.zero?
      @cars << car
      car.train = self
      puts "Car #{car} successfully added to the train #{train_num}"
    else
      puts 'Cant add car to the train!'
    end
  end

  # кроме методов, которые и должны что-то выводить на экран. выводим подсказки
  def car_remove(car)
    if car.train == self && @speed.zero?
      @cars.delete(car)
      car.train = nil
      puts "Car #{car} successfully removed from the train #{train_num}"
    elsif @speed != 0; puts "Train on a go. Can't change the cars! Stop the train first"
    else
      puts "Car #{car} is not in #{train_num}"
    end
  end

  # используется напрямую снаружи класса
  def get_route(map)
    @current_route = map
    @current_route.start_station.train_arrival(self)
    @current_station = @current_route.start_station
  end

  # используется напрямую снаружи класса
  def move(direction)
    directions = %w[fwd back]
    raise "Error: type must be 'fwd' or 'back'" unless directions.include?(direction)

    if direction == 'fwd' && @current_station != @current_route.route[-1]
      move_fwd
    elsif direction == 'back' && @current_station != @current_route.route[0]
      move_back
    end
    @current_station.name
  end

  # используется напрямую снаружи класса
  def prev_station
    station_num = @current_route.route.find_index(@current_station)

    @current_route.route[station_num - 1] if station_num.positive?
  end

  # используется напрямую снаружи
  def next_station
    station_num = @current_route.route.find_index(@current_station)

    @current_route.route[station_num + 1] if station_num < @current_route.route.size - 1
  end

  def validate!
    raise 'Wrong train num!' if @train_num !~ NUM
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  # используется только внутри класса и подклассами - private
  def new_speed(speed)
    @speed = speed
  end

  # используется только внутри класса и подклассами - private
  def stop
    @speed = 0
  end

  def validate_delete_wagon!
    raise 'No cars available!' if @cars.empty?
  end

  def validate_next_station!
    raise 'This is final station!' if @current_station == @current_route.first.stations[-1]
  end

  def validate_prev_station!
    raise 'Это начальная станция!' if @current_station == @current_route.first.stations[0]
  end

end
