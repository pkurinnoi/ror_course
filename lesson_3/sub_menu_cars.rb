module SubMenuCars
  def sub_menu_cars(item)
    case item
    when 1
      puts 'To create new car choose its type by number'
      puts '1. Passenger car'
      puts '2. Cargo car'
      car_id = gets.to_i
      case car_id
      when 1
        puts 'Enter number of seats'
        amount = gets.to_i
        car = PassCar.new(amount)
        @cars << car
        puts "New Passenger Car #{car} created!"
      when 2
        puts 'Enter the size of car space'
        amount = gets.to_i
        car = CargoCar.new(amount)
        @cars << car
        puts "New Cargo Car #{car} created!"
      end
    when 2
      puts 'The list of cars:'
      @cars.each do |car_odj|
        puts "#{car_odj}, num: #{car_odj.car_num}"
      end
    when 3
      puts 'Choose the car to take a seat or space'
      cars_list_array
      car_id = gets.to_i
      case @cars[car_id].type
      when 'pass'
        @cars[car_id].qty_increase(1)
      when 'cargo'
        puts "Enter cargo space you want to take. Free space is #{@cars[car_id].free_amount}"
        qty = gets.to_i
        @cars[car_id].qty_increase(qty)
      end
    end
    puts '----'
  end
end
