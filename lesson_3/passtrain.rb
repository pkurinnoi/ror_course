class PassengerTrain < Train
  include InstanceCounter

  def initialize(train_num, speed = 0)
    @train_num = train_num
    @type = 'pass'
    @speed = speed
    @cars = []

    add_to_list(train_num)
    register_instance
  end
end
