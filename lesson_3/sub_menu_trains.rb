# frozen_string_literal: true

module SubMenuTrains

  def sub_menu_trains(item)
    case item
    when 1 then new_train
    when 2 then list_trains
    when 3 then remove_trains
    when 4 then add_routes
    when 5 then add_cars
    when 6 then remove_cars
    when 7 then move_train
    when 8 then prev_next_station
    when 9 then list_cars
    end
    puts '----'
  end
end
