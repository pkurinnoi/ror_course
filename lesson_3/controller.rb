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
      puts '8. Find previous and next stations'
      puts '9. Train cars list'
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
      puts '3. Take a car seat or space'
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
      @stations[station].check { |train| puts "#{train.train_num}, #{train.type}, #{train.cars.size}" }
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
      attempt = 0
      begin
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
      rescue RuntimeError => e
        puts "#{e.message} Enter valid train number!"
        attempt += 1
        retry if attempt < 3
      ensure
        puts "#{attempt} attempts failed!"
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
      puts "To add car to the train please choose the train from the list by number"
      trains_list_array
      train_id = gets.to_i
      puts "To add car to the train please choose the car from the list by number"
      cars_list_array
      car_id = gets.to_i
      train = @trains[train_id]
      car = @cars[car_id]
      train.car_add(car)
    when 6
      puts "To remove car to the train please choose the train from the list by number"
      trains_list_array
      train_id = gets.to_i
      if @trains[train_id].cars.empty?
        puts "Train #{@trains[train_id].train_num} have 0 cars!"
      else
        puts "To remove car from the train please choose the car from the list by number"
        i = 0
        @trains[train_id].cars.each do |car|
          puts "#{i}. #{car}. Train #{car.train}"
          i += 1
        end
        car_id = gets.to_i
        @trains[train_id].car_remove(@cars[car_id])
      end
    when 7
      puts "To move the train please choose the train from the list by number"
      trains_list_array
      train_id = gets.to_i
      if @trains[train_id].current_station != nil
        puts "Choose the direction"
        puts "1. Move Forward"
        puts "2. Move Back"
        directrion_id = gets.to_i
        if directrion_id == 1
          @trains[train_id].move('fwd')
        elsif directrion_id == 2
          @trains[train_id].move('back')
        end
      else
        puts "Train #{@trains[train_id].train_num} haven't get any route"
      end
    when 8
      puts "To view previous and next stations please choose the train from the list by number"
      trains_list_array
      train_id = gets.to_i
      if @trains[train_id].next_station.nil?
        puts "There is no next station in the route for the train #{@trains[train_id].train_num}"
      else
        puts "The next station for the train #{@trains[train_id].train_num} is #{@trains[train_id].next_station.name}"
      end
      if @trains[train_id].prev_station.nil?
        puts "There is no previous station in the route for the train #{@trains[train_id].train_num}"
      else
        puts "The previous station for the train #{@trains[train_id].train_num} is #{@trains[train_id].prev_station.name}"
      end
    when 9
      puts "To check the cars please choose the train from the list by number"
      trains_list_array
      train_id = gets.to_i
      @trains[train_id].check { |car| puts "#{car.car_num}, #{car.type}, #{car.qty}, #{car.free_amount}" }
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
      puts "Please choose the route number from the list"
      routes_list_array
      route_id = gets.to_i
      puts "#{@routes[route_id].route}"

    when 3
      puts "Please choose the route number from the list"
      routes_list_array
      route_id = gets.to_i
      puts "Please choose the station to add to the middle of the route"
      stations_list_array
      station_id = gets.to_i
      @routes[route_id].add(@stations[station_id])
    when 4
      puts "Please choose the route number from the list"
      routes_list_array
      route_id = gets.to_i
      puts "Please choose the station to remove to the middle of the route"
      i = 0
      @routes[route_id].middle.each do |station|
        puts "#{i}. #{station.name}"
        i += 1
      end
      station_id = gets.to_i
      @routes[route_id].middle.delete_at(station_id)
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
        puts "Enter number of seats"
        amount = gets.to_i
        car = PassCar.new(amount)
        @cars << car
        puts "New Passenger Car #{car} created!"
      elsif car_id == 2
        puts "Enter the size of car space"
        amount = gets.to_i
        car = CargoCar.new(amount)
        @cars << car
        puts "New Cargo Car #{car} created!"
      end
    when 2
      puts "The list of cars:"
      @cars.each do |car|
        puts "#{car}, num: #{car.car_num}"
      end
    when 3
      puts "Choose the car to take a seat or space"
      cars_list_array
      car_id = gets.to_i
      if @cars[car_id].type == 'pass'
        @cars[car_id].qty_increase(1)
      elsif @cars[car_id].type == 'cargo'
        puts "Enter cargo space you want to take. Free space is #{@cars[car_id].free_amount}"
        qty = gets.to_i
        @cars[car_id].qty_increase(qty)
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
    @cars.each do |car|
      puts "#{i}. #{car}. Train #{car.train}"
      i += 1
    end
  end
end
