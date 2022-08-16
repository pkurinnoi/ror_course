# frozen_string_literal: true

module SubMenuStations
  def sub_menu_staions(item)
    case item
    when 1 then new_station
    when 2 then list_stations
    when 3 then remove_stations
    when 4 then list_trains_on_station
    end
    puts '----'
  end

  def new_staiton
    puts 'To create new station, please input its name'
    station = Station.new(gets.strip.chomp.downcase)
    @stations << station
    puts "New station #{station.name} succesfully created"
  end

  def list_stations
    puts 'Trains World have the next stations:'
    @stations.each { |station_obj| puts station_obj.name.to_s }
  end

  def remove_stations
    puts 'To remove station please input its number'
    stations_list_array
    @stations.delete_at(gets.to_i)
    puts 'Done'
  end

  def list_trains_on_station
    puts 'To view the list of trains on the exact station, please input its number'
    stations_list_array
    @stations[gets.to_i].check { |train| puts "#{train.train_num}, #{train.type}, #{train.cars.size}" }
  end
end
