# frozen_string_literal: true

class CargoTrain < Train
  include InstanceCounter
  include Accessors
  include Validation

  def initialize(train_num, speed = 0)
    @type = 'cargo'

    add_to_list
    register_instance

    super

    validate!
  end
end
