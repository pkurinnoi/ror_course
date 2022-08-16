# frozen_string_literal: true

class Controller
  include Arrays
  include SubMenuStations
  include SubMenuTrains
  include SubMenuRoutes
  include SubMenuCars

  attr_reader :stations, :trains, :routes, :cars

  MAIN_MENU = ['1. Manage stations',
               '2. Manage trains',
               '3. Manage routes',
               '4. Manage cars',
               '0. Exit'].freeze

  TRAINS_MENU = ['1. Create train',
                 '2. List trains',
                 '3. Remove train',
                 '4. Add route to the train',
                 '5. Add cars to the train',
                 '6. Remove cars from the train',
                 '7. Move the train',
                 '8. Find previous and next stations',
                 '9. Train cars list'].freeze

  STATIONS_MENU = ['1. Create station',
                   '2. List stations',
                   '3. Remove station',
                   '4. List trains on the exact station'].freeze

  ROUTES_MENU = ['1. Create route',
                 '2. List stations in the route',
                 '3. Add station to the route',
                 '4. Remove stations from the route'].freeze

  CARS_MENU = ['1. Create car',
               '2. List cars',
               '3. Take a car seat or space'].freeze

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @cars = []
  end

  def main_menu
    puts 'Choose the number of an option you want to do in the Trains World'
    puts(*MAIN_MENU)
  end

  def main_menu_run(item)
    case item
    when 1
      stations_menu
    when 2
      trains_menu
    when 3
      routes_menu
    when 4
      cars_menu
    end
  end

  def stations_menu
    puts 'Choose the number of an option you want to do with the Stations'
    puts(*STATIONS_MENU)
    sub_menu_staions(gets.to_i)
  end

  def trains_menu
    puts 'Choose the number of an option you want to do with the Trains'
    puts(*TRAINS_MENU)
    sub_menu_trains(gets.to_i)
  end

  def routes_menu
    puts 'Choose the number of an option you want to do with the Routes'
    puts(*ROUTES_MENU)
    sub_menu_routes(gets.to_i)
  end

  def cars_menu
    puts 'Choose the number of an option you want to do with the Cars'
    puts(*CARS_MENU)
    sub_menu_cars(gets.to_i)
  end
end
