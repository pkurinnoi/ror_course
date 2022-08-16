module TrainsActions

  def new_train
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
  end

  def list_trains
    puts 'Trains World have the next trains:'
    @trains.each do |train_obj|
      puts train_obj.train_num.to_s
    end
  end

  def remove_trains
    puts 'To remove train please input its number'
    trains_list_array
    train_to_remove = gets.to_i
    @trains.delete_at(train_to_remove)
    puts 'Done'
  end

  def move_train
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
  end

  def add_routes
    puts 'Please choose the train number from the list'
    trains_list_array
    train_id = gets.to_i
    puts 'Please choose the route number from the list'
    routes_list_array
    route_id = gets.to_i
    train = @trains[train_id]
    route = @routes[route_id]
    train.get_route(route)
  end

  def prev_next_station
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
  end
end
