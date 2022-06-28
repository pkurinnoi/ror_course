class Station
  def initialize(st_name)
    @st_name = st_name
    @trains_list = []
    station_name
  end

  def station_name
    @st_name
  end

  def train_arrival(train)
    train_info = [train.num, train.type, train.car_num]
    @trains_list.push(train_info)
  end

  def trains_list
    @trains_list
  end

  def trains_list_by_type(type)
    types = ['pass','cargo']
    raise "Error: type must be 'pass' or 'cargo'" unless types.include?(type)

    temporary_trains_list_by_type = []
    @trains_list.map do|train_info|
      if train_info.include? type
        temporary_trains_list_by_type.push(train_info)
      end
    end
    temporary_trains_list_by_type
  end

  def train_departure(train_num)
    if @trains_list.include? train_num
      @trains_list.delete(train_num)
      puts "Train #{train_num} departured from #{@st_name}"
    else
      puts "There is no train #{train_num} in #{@st_name}"
    end
  end

end
