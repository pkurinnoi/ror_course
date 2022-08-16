# frozen_string_literal: true

module TrainsActions
  TRAIN_CREATE_MENU = ['To create the train please choose its type by number',
                       '1. Passenger Train',
                       '2. Cargo Train'].freeze

  TRAIN_MOVE_MENU = ['Choose the direction',
                     '1. Move Forward',
                     '2. Move Back'].freeze

  def new_train
    puts(*TRAIN_CREATE_MENU)
    @type = gets.to_i
    train_builder
  end

  def train_builder
    attempt = 0
    begin
      train_creator
    rescue RuntimeError => e
      puts "#{e.message} Enter valid train number!"
      attempt += 1
      retry if attempt < 3
    ensure
      puts "#{attempt} attempts failed!"
    end
  end

  def train_creator
    puts 'Input the train number'
    train_num = gets.strip.chomp.downcase
    case @type
    when 1
      train = PassengerTrain.new(train_num)
      @trains << train
    when 2
      train = CargoTrain.new(train_num)
      @trains << train
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
  end

  def move_train
    puts 'To move the train please choose the train from the list by number'
    trains_list_array
    @train_id = gets.to_i
    train_mover
  end

  def train_mover
    if !@trains[@train_id].current_station.nil?
      puts(*TRAIN_MOVE_MENU)
      exact_move
    else
      puts "Train #{@trains[@train_id].train_num} haven't get any route"
    end
  end

  def exact_move
    directrion_id = gets.to_i
    case directrion_id
    when 1
      @trains[@train_id].move('fwd')
    when 2
      @trains[@train_id].move('back')
    end
  end

  def add_routes
    puts 'Please choose the train number from the list'
    trains_list_array
    train = @trains[gets.to_i]
    puts 'Please choose the route number from the list'
    routes_list_array
    route = @routes[gets.to_i]
    train.get_route(route)
  end

  def prev_next_station
    puts 'To view previous and next stations please choose the train from the list by number'
    trains_list_array
    @train_id = gets.to_i
    next_station_checker
    prev_station_checker
  end

  def next_station_checker
    if @trains[@train_id].next_station.nil?
      puts "There is no next station in the route for the train #{@trains[@train_id].train_num}"
    else
      puts "The next station for the train #{@trains[@train_id].train_num} is #{@trains[@train_id].next_station.name}"
    end
  end

  def prev_station_checker
    if @trains[@train_id].prev_station.nil?
      puts "There is no previous station in the route for the train #{@trains[@train_id].train_num}"
    else
      puts "The previous station for train #{@trains[@train_id].train_num} is #{@trains[@train_id].prev_station.name}"
    end
  end
end
