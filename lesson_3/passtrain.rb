class PassengerTrain < Train
  def initialize(train_num, speed = 0)
    @train_num = train_num
    @type = 'pass'
    @speed = speed
    @cars = []
  end
end
