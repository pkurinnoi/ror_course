class Route
  attr_reader :start_station

  attr_accessor :middle

  def initialize(start_station, final_station)
    @middle = []
    @start_station = start_station
    @final_station = final_station
  end

  def add(station)
    @middle << station
    puts "Stations #{station.name} successfully added to the route!"
  end

  def remove(station)
    @middle.delete(station)
  end

  def route
    [[@start_station], @middle, [@final_station]].flatten(1)
  end
end
