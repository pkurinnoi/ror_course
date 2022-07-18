class Controller
  attr_reader :stations
  attr_reader :trains
  attr_reader :routes
  attr_reader :cars

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @cars = []
  end

  def main_menu
    puts 'Choose the number of an option you want to do in the Trains World'
    puts '1. Manage stations'
    puts '2. Manage trains'
    puts '3. Manage routes'
    puts '4. Manage cars'
    puts '0. Exit'
  end

  def main_menu_run(item)
    case item
    when 1
      puts 'Choose the number of an option you want to do with the Stations'
      puts '1. Create station'
      puts '2. List stations'
      puts '3. Remove station'
      puts '4. List trains on the exact station'
      sub_menu_stations_item = gets.to_i
      sub_menu_staions(sub_menu_stations_item)
    when 2
      puts 'Choose the number of an option you want to do with the Trains'
      puts '1. Create train'
      puts '2. List trains'
      puts '3. Remove train'
      puts '4. Add route to the train'
      puts '5. Add cars to the train'
      puts '6. Remove cars from the train'
      puts '7. Move the train'
      sub_menu_trains_item = gets.to_i
      sub_menu_trains(sub_menu_trains_item)
    when 3
      puts 'Choose the number of an option you want to do with the Routes'
      puts '1. Create route'
      puts '2. List stations in the route'
      puts '3. Add station to the route'
      puts '4. Remove stations from the route'
      sub_menu_routes_item = gets.to_i
      sub_menu_routes(sub_menu_routes_item)
    when 4
      puts 'Choose the number of an option you want to do with the Cars'
      puts '1. Create car'
      puts '2. List cars'
      puts '3. Remove car'
      sub_menu_cars_item = gets.to_i
      sub_menu_cars(sub_menu_cars_item)
    end
  end

  def sub_menu_staions(item)
    case item
    when 1
      puts "To create new station, please input its name"
      new_station_name = gets.strip.chomp.downcase
      station = Station.new(new_station_name)
      @stations << station
      puts "New station #{station.name} succesfully created"
    when 2
      puts "Trains World have the next stations:"
      @stations.each do |station|
        puts "#{station.name}"
      end
    when 3
      puts "To remove station please input its number"
      stations_list_array
      station_to_remove = gets.to_i
      @stations.delete_at(station_to_remove)
      puts "Done"
    when 4
      puts "To view the list of trains on the exact station, please input its number"
      stations_list_array
      station = gets.to_i
      puts "The next trains are on the station #{@stations[station].name}"
      puts "#{@stations[station].trains_list}"
    end
    puts "----"
  end

  def sub_menu_trains(item)
    case item
    when 1
      puts "To create the train please choose its type by number"
      puts "1. Passenger Train"
      puts "2. Cargo Train"
      type = gets.to_i
      puts "Input the train number"
      train_num = gets.strip.chomp.downcase
      if type == 1
        train = PassengerTrain.new(train_num)
        @trains << train
        puts "Passenger train number #{train_num} successfully created!"
      elsif type == 2
        train = CargoTrain.new(train_num)
        @trains << train
        puts "Cargo train number #{train_num} successfully created!"
      end
    when 2
      puts "Trains World have the next trains:"
      @trains.each do |train|
        puts "#{train.train_num}"
      end
    when 3
      puts "To remove train please input its number"
      trains_list_array
      train_to_remove = gets.to_i
      @trains.delete_at(train_to_remove)
      puts "Done"
    when 4
      #TODO
      puts "Please choose the train number from the list"
      trains_list_array
      train_id = gets.to_i
      puts "Please choose the route number from the list"
      routes_list_array
      route_id = gets.to_i
      train = @trains[train_id]
      route = @routes[route_id]
      train.get_route(route)
    when 5
      #TODO
      puts "under construction"
    when 6
      #TODO
      puts "under construction"
    when 7
      #TODO
      puts "under construction"
    end
    puts "----"
  end

  def sub_menu_routes(item)
    case item
    when 1
      puts "To create new route please input the station number"
      stations_list_array
      start_station_id = gets.to_i
      puts "And the final station"
      stations_list_array
      final_station_id = gets.to_i
      start_station = @stations[start_station_id]
      final_station = @stations[final_station_id]
      route = Route.new(start_station, final_station)
      @routes << route
      puts "New route #{route} created"
    when 2
      #TODO
      puts "under construction"
    when 3
      #TODO
      puts "under construction"
    when 4
      #TODO
      puts "under construction"
    end
    puts "----"
  end

  def sub_menu_cars(item)
    case item
    when 1
      puts "To create new car choose its type by number"
      puts "1. Passenger car"
      puts "2. Cargo car"
      car_id = gets.to_i
      if car_id == 1
        car = PassCar.new
        @cars << car
        puts "New Passenger Car #{car} created!"
      elsif car_id == 2
        car = CargoCar.new
        @cars << car
        puts "New Cargo Car #{car} created!"
      end
    when 2
      puts "The list of cars:"
      @cars.each do |car|
        puts "#{car}"
      end
    end
    puts "----"
  end

  private

  def stations_list_array
    i = 0
    @stations.each do |station|
      puts "#{i}. #{station.name}"
      i += 1
    end
  end

  def trains_list_array
    i = 0
    @trains.each do |train|
      puts "#{i}. #{train.train_num}"
      i += 1
    end
  end

  def routes_list_array
    i = 0
    @routes.each do |route|
      puts "#{i}. #{route.route}"
      i += 1
    end
  end

  def cars_list_array
    i = 0
    @rcars.each do |car|
      puts "#{i}. #{car}"
      i += 1
    end
  end
end
