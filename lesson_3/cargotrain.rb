class CargoTrain < Train
  include InstanceCounter

  NUM = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/

  def initialize(train_num, speed = 0)
    @train_num = train_num
    @type = 'cargo'
    @speed = speed
    @cars = []

    add_to_list
    register_instance
    validate!
  end

  def validate!
    raise "Wrong train number!" if @train_num !~ NUM
    raise "Wrong type!" if @type != 'cargo'
    raise "Train speed must be '0'!" if @speed != 0
    raise "Wrong number of cars!" if @cars.any?
  end

  def valid?
    validate!
    true
  rescue
    false
  end
end
