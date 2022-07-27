require_relative 'vendor'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'passtrain'
require_relative 'cargotrain'
require_relative 'car'
require_relative 'passcar'
require_relative 'cargocar'
require_relative 'controller'


puts "Welcome to the Trains World! Let' play the trains!"

controller = Controller.new

loop do
  controller.main_menu
  main_menu_item = gets.to_i
  break if main_menu_item == 0
  controller.main_menu_run(main_menu_item)
end
