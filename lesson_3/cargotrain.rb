class CargoTrain < Train
  include InstanceCounter

  def initialize(train_num, speed = 0)
    @train_num = train_num
    @type = 'cargo'
    @speed = speed
    @cars = []

    add_to_list
    register_instance
    validate!
  end
end
