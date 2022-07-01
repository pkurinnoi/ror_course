class Car
  attr_reader :rpm

  def initialize
    @rpm = 0
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    rpm.zero?
  end

  private

  attr_writer :rpm

  def initial_rpm
    700
  end

  def start_engine!
    self.rpm = initial_rpm
  end
end

class Track < Car

  def loading
  end

  def wrong_method
    self.start_engine!
  end

  private

  def initial_rpm
    500
  end
end

class SportCar < Car

  private

  def initial_rpm
    1000
  end
end
