module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validations
      @validations ||= []
    end
    def validate(attribute, validation_type, params = nil)
      validations.push({attr: attribute, type: validation_type, mask: params})
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate!(options = nil)
      source = self.class.superclass == Object ? self.class : self.class.superclass
      checks = source.instance_variable_get("@validations")

      checks.each do |hash|
        val = self.instance_variable_get("@#{hash[:attr]}")
        option = hash[:mask] ? hash[:mask] : options
        send("validate_#{hash[:type].to_s}".to_sym, hash[:attr],  val, option)
      end
    end
  end

  def presense(name, value, _)
    raise "#{name} value is nil" if value.nil?
    raise "#{name} value is empty" if value.to_s == ""
  end

  def format(name, value, params)
    raise "#{name} with value #{value} do not fir: #{params.to_s}" if value.to_s !~ params
  end

  def type(name, value, params)
    raise "#{name} with value #{value} has different class #{value.class} than #{params}" if value.class.to_s != type.to_s
  end

  def validate_length(name, value, params)
    raise "Length #{value} is bad" unless value.to_s.length.between?(params.first, params.last)
  end

  def validate_not_yet_existed(name, value, params)
    raise "Object #{name} with #{value} already exist!" if params.any? do |i|
      i.instance_variable_get("@#{name}") == value
    end
  end

  def validate_existed(name, value, params)
    raise "=Object #{name} with #{value} does not exist!" if params.none? do |i|
      i.instance_variable_get("@#{name}") == value
    end
  end
end
