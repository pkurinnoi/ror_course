# frozen_string_literal: true

module TrainCarsActions
  def add_cars
    puts 'To add car to the train please choose the train from the list by number'
    trains_list_array
    train = @trains[gets.to_i]
    puts 'To add car to the train please choose the car from the list by number'
    cars_list_array
    car = @cars[gets.to_i]
    train.car_add(car)
  end

  def remove_cars
    puts 'To remove car to the train please choose the train from the list by number'
    trains_list_array
    train_id = gets.to_i
    if @trains[train_id].cars.empty?
      puts "Train #{@trains[train_id].train_num} have 0 cars!"
    else
      car_removal
    end
  end

  def list_cars
    puts 'To check the cars please choose the train from the list by number'
    trains_list_array
    train_id = gets.to_i
    @trains[train_id].check do |car_obj|
      puts "#{car_obj.car_num}, #{car_obj.type}, #{car_obj.qty}, #{car_obj.free_amount}"
    end
  end

  def car_removal
    puts 'To remove car from the train please choose the car from the list by number'
    i = 0
    @trains[train_id].cars.each do |car_obj|
      puts "#{i}. #{car_obj}. Train #{car_obj.train}"
      i += 1
    end
    @trains[train_id].car_remove(@cars[gets.to_i])
  end
end
