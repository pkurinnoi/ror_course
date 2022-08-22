module Accessors
  def attr_accessor_with_history(*args)
    args.each do |name|
      var_name_history = "@#{name}_old".to_sym
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          instance_variable_set(var_name_history, (instance_variable_get(var_name_history) || []) + [instance_variable_get(var_name)])
      end
      define_method("#{name}_history".to_sym) { instance_variable_get(var_name_history) }
    end
  end

  def strong_attr_accessor(name, var_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if value.class.to_s == var_class.to_s
        instance_variable_set(var_name, value)
      else
        raise RuntimeError, "Wrong value class: #{value.class}"
      end
    end
  end
end
