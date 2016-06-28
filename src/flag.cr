class OptionFlag

  @@flags = { } of Symbol => OptionFlag

  def register_flag (name)
    @@flags[name] = self
  end

  # Actual OptionFlag methods

  def initialize (name : Symbol, key : String, desc : String, &block)
    @name = name
    @key = key
    @desc = desc
    self.register_flag (name)
  end

  def name
    "#{@name.to_s.capitalize}OptionFlag"
  end

  def self.handle_flag (blerp, parser, data)
    # nop
  end

end

def define_flag (name, key, desc, &block)
  c = OptionFlag.new name, key, desc, &block
  puts("#{c.name} registered")
  #Object.const_set("#{name.to_s.capitalize}OptionFlag", c)
end
