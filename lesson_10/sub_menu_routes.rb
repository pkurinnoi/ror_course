# frozen_string_literal: true

module SubMenuRoutes
  def sub_menu_routes(item)
    case item
    when 1 then new_route
    when 2 then list_route
    when 3 then add_station
    when 4 then remove_station
    end
    puts '----'
  end

  def new_route
    puts 'To create new route please input the station number'
    stations_list_array
    start_station = @stations[gets.to_i]
    puts 'And the final station'
    stations_list_array
    final_station = @stations[gets.to_i]
    route = Route.new(start_station, final_station)
    @routes << route
    puts "New route #{route} created"
  end

  def list_route
    puts 'Please choose the route number from the list'
    routes_list_array
    route_id = gets.to_i
    puts @routes[route_id].route.to_s
  end

  def add_station
    puts 'Please choose the route number from the list'
    routes_list_array
    route_id = gets.to_i
    puts 'Please choose the station to add to the middle of the route'
    stations_list_array
    station_id = gets.to_i
    @routes[route_id].add(@stations[station_id])
  end

  def remove_station
    puts 'Please choose the route number from the list'
    routes_list_array
    route_id = gets.to_i
    puts 'Please choose the station to remove to the middle of the route'
    i = 0
    @routes[route_id].middle.each do |station|
      puts "#{i}. #{station.name}"
      i += 1
    end
    @routes[route_id].middle.delete_at(gets.to_i)
  end
end
