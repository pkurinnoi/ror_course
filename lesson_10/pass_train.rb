# frozen_string_literal: true

class PassengerTrain < Train
  include InstanceCounter
  include Accessors
  include Validation

  def initialize(train_num, speed = 0)
    @type = 'pass'

    add_to_list
    register_instance

    super

    validate!
  end
end
