class Settings
  def add(key, value)
    binding.irb
    key = key.to_sym
    singleton_class.instance_variable_set(:@configs, {}) unless singleton_class.instance_variable_defined?(:@configs)
    configs[key] = value
    define_singleton_method(key) { configs[key] }
  end

  def method_missing(method_name, *args, &block)
    configs[method_name] if configs.key?(method_name)
  end

  def respond_to_missing?(method_name, include_private = false)
    configs.key?(method_name) || super
  end

  def configs
    singleton_class.instance_variable_get(:@configs) || {}
  end
end

settings = Settings.new
settings.add(:timeout, 30)
settings.add(:mode, "production")

puts settings.timeout # => 30
puts settings.mode # => "production"

# Tentando acessar configuração inexistente
puts settings.retry # => "Configuração 'retry' não existe

# Checando se um método está disponível"
puts settings.respond_to?(:timeout) # => true
puts settings.respond_to?(:retry) # => false

