class CargoTrain < Train
  def initialize(train_num, speed = 0)
    @train_num = train_num
    @type = 'cargo'
    @speed = speed
    @cars = []

    @@all_trains[train_num] = self
  end
end
