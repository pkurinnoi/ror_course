module SubMenuTrains
  def sub_menu_trains(item)
    case item
    when 1
      puts 'To create the train please choose its type by number'
      puts '1. Passenger Train'
      puts '2. Cargo Train'
      type = gets.to_i
      attempt = 0
      begin
        puts 'Input the train number'
        train_num = gets.strip.chomp.downcase
        case type
        when 1
          train = PassengerTrain.new(train_num)
          @trains << train
          puts "Passenger train number #{train_num} successfully created!"
        when 2
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
      puts 'Trains World have the next trains:'
      @trains.each do |train_obj|
        puts train_obj.train_num.to_s
      end
    when 3
      puts 'To remove train please input its number'
      trains_list_array
      train_to_remove = gets.to_i
      @trains.delete_at(train_to_remove)
      puts 'Done'
    when 4
      puts 'Please choose the train number from the list'
      trains_list_array
      train_id = gets.to_i
      puts 'Please choose the route number from the list'
      routes_list_array
      route_id = gets.to_i
      train = @trains[train_id]
      route = @routes[route_id]
      train.get_route(route)
    when 5
      puts 'To add car to the train please choose the train from the list by number'
      trains_list_array
      train_id = gets.to_i
      puts 'To add car to the train please choose the car from the list by number'
      cars_list_array
      car_id = gets.to_i
      train = @trains[train_id]
      car = @cars[car_id]
      train.car_add(car)
    when 6
      puts 'To remove car to the train please choose the train from the list by number'
      trains_list_array
      train_id = gets.to_i
      if @trains[train_id].cars.empty?
        puts "Train #{@trains[train_id].train_num} have 0 cars!"
      else
        puts 'To remove car from the train please choose the car from the list by number'
        i = 0
        @trains[train_id].cars.each do |car_obj|
          puts "#{i}. #{car_obj}. Train #{car_obj.train}"
          i += 1
        end
        car_id = gets.to_i
        @trains[train_id].car_remove(@cars[car_id])
      end
    when 7
      puts 'To move the train please choose the train from the list by number'
      trains_list_array
      train_id = gets.to_i
      if !@trains[train_id].current_station.nil?
        puts 'Choose the direction'
        puts '1. Move Forward'
        puts '2. Move Back'
        directrion_id = gets.to_i
        case directrion_id
        when 1
          @trains[train_id].move('fwd')
        when 2
          @trains[train_id].move('back')
        end
      else
        puts "Train #{@trains[train_id].train_num} haven't get any route"
      end
    when 8
      puts 'To view previous and next stations please choose the train from the list by number'
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
        puts "The previous station for train #{@trains[train_id].train_num} is #{@trains[train_id].prev_station.name}"
      end
    when 9
      puts 'To check the cars please choose the train from the list by number'
      trains_list_array
      train_id = gets.to_i
      @trains[train_id].check do |car_obj|
        puts "#{car_obj.car_num}, #{car_obj.type}, #{car_obj.qty}, #{car_obj.free_amount}"
      end
    end
    puts '----'
  end
end
