require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'passtrain'
require_relative 'cargotrain'
require_relative 'passcar'
require_relative 'cargocar'


puts "Let' play the trains! First of all we need to create the world. Please add as many stations as you want, when you will finish creating the world, please write 'Done'"

loop do
  puts "Write down the name of the new station:"
  new_station_name = gets.chomp.downcase
  break if new_station_name == 'done'
  new_station_name = Station.new
end
