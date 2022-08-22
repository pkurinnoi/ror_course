module Validation
  def validate(name, type, params = nil)
    case type
    when 'presense' then presense(name)
    when 'format' then format(name, params)
    when 'type' then type(name, params)
    end
  end

  def presense(name)
    name.nil? && name.empty?
  end

  def format

  end

  def type

  end

end
