# frozen_string_literal: true

class Route
  include InstanceCounter
  include Accessors
  include Validation

  attr_reader :start_station

  attr_accessor :middle

  def initialize(start_station, final_station)
    validate!
    register_instance
    @middle = []
    @start_station = start_station
    @final_station = final_station
  end

  def add(station)
    @middle << station
  end

  def remove(station)
    @middle.delete(station)
  end

  def route
    [[@start_station], @middle, [@final_station]].flatten(1)
  end

  def validate!
    raise 'Create start station first!' unless Station.all.filter { |obj| obj.name == @start_station }.empty?
    raise 'Create final station first!' unless Station.all.filter { |obj| obj.name == @final_station }.empty?
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
