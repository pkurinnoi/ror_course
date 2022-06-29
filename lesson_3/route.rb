class Route
  def initialize(start_station = 'start', final_station = 'finish')
    @middle = []
    @start = [start_station]
    @final = [final_station]
  end

  def add(station)
    @middle.push [station]
  end

  def remove(station)
    @middle.delete(station)
  end

  def route
    [@start, @middle, @final].flatten
  end
end
