# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation

  validate :name, :presence
  validate :name, :length, [1, 20]
  validate :name, :not_yet_existed

  class << self
    attr_accessor :all_stations
  end

  attr_reader :trains_list, :name

  NAME = /^\w*$/.freeze

  Station.all_stations = []

  def self.all
    Station.all_stations
  end

  def initialize(st_name)
    register_instance
    @name = st_name
    @trains_list = []
    Station.all_stations << self
    validate!
  end

  def check(&block)
    @trains_list.each(&block)
  end

  def train_arrival(train)
    @trains_list.push(train)
  end

  def trains_list_by_type(type)
    types = %w[pass cargo]
    raise "Error: type must be 'pass' or 'cargo'" unless types.include?(type)

    temporary_trains_list_by_type = []
    @trains_list.map do |train_info|
      temporary_trains_list_by_type.push(train_info) if train_info.include? type
    end
    { temporary_trains_list_by_type.size => temporary_trains_list_by_type }
  end

  def by_type
    @trains_list.map { |train| train if train.type.includes?(types) }
  end

  def train_departure(train)
    @trains_list.delete(train) if @trains_list.include? train
  end

  def validate!
    raise 'Wrong name!' if name !~ NAME
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
