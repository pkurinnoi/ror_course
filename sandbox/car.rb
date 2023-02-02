require_relative '../lesson_10/validation'

class Car
  include Validation

  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, /[A-Z]/

  def initialize(name = nil)
    @name = name
    validate!
  end
end
