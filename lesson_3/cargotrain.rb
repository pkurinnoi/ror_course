class CargoTrain < Train
  include InstanceCounter

  def initialize(train_num, speed = 0)
    @train_num = train_num
    @type = 'cargo'
    @speed = speed
    @cars = []

    add_to_list(train_num)
    register_instance
  end
end
