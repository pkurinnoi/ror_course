# frozen_string_literal: true

module Arrays
  def stations_list_array
    i = 0
    @stations.each do |station_obj|
      puts "#{i}. #{station_obj.name}"
      i += 1
    end
  end

  def trains_list_array
    i = 0
    @trains.each do |train_obj|
      puts "#{i}. #{train_obj.train_num}"
      i += 1
    end
  end

  def routes_list_array
    i = 0
    @routes.each do |route_obj|
      puts "#{i}. #{route_obj.route}"
      i += 1
    end
  end

  def cars_list_array
    i = 0
    @cars.each do |car_obj|
      puts "#{i}. #{car_obj}. Train #{car_obj.train}"
      i += 1
    end
  end
end
