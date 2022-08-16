# frozen_string_literal: true

module TrainMove
  def move_fwd
    @current_station.train_departure(self)
    @speed = 200
    @current_station = next_station
    @current_station.train_arrival(self)
    stop
  end

  def move_back
    @current_station.train_departure(self)
    @speed = 200
    @current_station = prev_station
    @current_station.train_arrival(self)
    stop
  end
end
