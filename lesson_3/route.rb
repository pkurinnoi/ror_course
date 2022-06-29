class Route
  attr_reader :start_station

  def initialize(start_station, final_station)
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
end
