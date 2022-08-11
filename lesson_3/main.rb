require_relative 'vendor'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'pass_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'pass_car'
require_relative 'cargo_car'
require_relative 'controller'

puts "Welcome to the Trains World! Let' play the trains!"

controller = Controller.new

loop do
  controller.main_menu
  main_menu_item = gets.to_i
  break if main_menu_item == 0
  controller.main_menu_run(main_menu_item)
end
