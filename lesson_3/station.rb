class Station
  include InstanceCounter

  attr_reader :trains_list
  attr_reader :name

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(st_name)
    register_instance
    @name = st_name
    @trains_list = []
    @@all_stations << self
  end

  def train_arrival(train)
    @trains_list.push(train)
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
    result = { temporary_trains_list_by_type.size() => temporary_trains_list_by_type }
    result
  end

  def by_type
    @trains_list.map { |train| train if train.type.includes?(types) }
  end

  def train_departure(train)
    if @trains_list.include? train
      @trains_list.delete(train)
    else
      puts "There is no train #{train} in #{@name}"
    end
  end

end
