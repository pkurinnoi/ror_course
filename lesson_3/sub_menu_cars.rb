# frozen_string_literal: true

module SubMenuCars
  def sub_menu_cars(item)
    case item
    when 1 then new_car_create
    when 2
      puts 'The list of cars:'
      @cars.each { |car_obj| puts "#{car_obj}, num: #{car_obj.car_num}" }
    when 3 then take_car
    end
    puts '----'
  end

  def new_car_create
    puts 'To create new car choose its type by number',
         '1. Passenger car',
         '2. Cargo car'
    new_by_type
  end

  def new_by_type
    case gets.to_i
    when 1
      puts 'Enter number of seats'
      car = PassCar.new(gets.to_i)
      @cars << car
    when 2
      puts 'Enter the size of car space'
      car = CargoCar.new(gets.to_i)
      @cars << car
    end
  end

  def take_car
    puts 'Choose the car to take a seat or space'
    cars_list_array
    take_by_type
  end

  def take_by_type
    case @cars[gets.to_i].type
    when 'pass'
      @cars[car_id].qty_increase(1)
    when 'cargo'
      puts "Enter cargo space you want to take. Free space is #{@cars[car_id].free_amount}"
      qty = gets.to_i
      @cars[car_id].qty_increase(qty)
    end
  end
end
