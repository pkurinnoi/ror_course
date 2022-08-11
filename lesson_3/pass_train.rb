class PassengerTrain < Train
  include InstanceCounter

  def initialize(train_num, speed = 0)
    @train_num = train_num
    @type = 'pass'
    @speed = speed
    @cars = []

    add_to_list
    register_instance
    validate!
  end
end
