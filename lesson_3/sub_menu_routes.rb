module SubMenuRoutes
  def sub_menu_routes(item)
    case item
    when 1
      puts 'To create new route please input the station number'
      stations_list_array
      start_station_id = gets.to_i
      puts 'And the final station'
      stations_list_array
      final_station_id = gets.to_i
      start_station = @stations[start_station_id]
      final_station = @stations[final_station_id]
      route = Route.new(start_station, final_station)
      @routes << route
      puts "New route #{route} created"
    when 2
      puts 'Please choose the route number from the list'
      routes_list_array
      route_id = gets.to_i
      puts @routes[route_id].route.to_s

    when 3
      puts 'Please choose the route number from the list'
      routes_list_array
      route_id = gets.to_i
      puts 'Please choose the station to add to the middle of the route'
      stations_list_array
      station_id = gets.to_i
      @routes[route_id].add(@stations[station_id])
    when 4
      puts 'Please choose the route number from the list'
      routes_list_array
      route_id = gets.to_i
      puts 'Please choose the station to remove to the middle of the route'
      i = 0
      @routes[route_id].middle.each do |station|
        puts "#{i}. #{station.name}"
        i += 1
      end
      station_id = gets.to_i
      @routes[route_id].middle.delete_at(station_id)
    end
    puts '----'
  end
end
