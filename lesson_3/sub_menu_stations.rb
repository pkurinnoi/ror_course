module SubMenuStations
  def sub_menu_staions(item)
    case item
    when 1
      puts 'To create new station, please input its name'
      station = Station.new(gets.strip.chomp.downcase)
      @stations << station
      puts "New station #{station.name} succesfully created"
    when 2
      puts 'Trains World have the next stations:'
      @stations.each { |station_obj| puts station_obj.name.to_s }
    when 3
      puts 'To remove station please input its number'
      stations_list_array
      @stations.delete_at(gets.to_i)
      puts 'Done'
    when 4
      puts 'To view the list of trains on the exact station, please input its number'
      stations_list_array
      @stations[gets.to_i].check { |train| puts "#{train.train_num}, #{train.type}, #{train.cars.size}" }
    end
    puts '----'
  end
end
