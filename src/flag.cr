class OptionFlag

  @@subclasses = { } of String => OptionFlag

  def self.create (type)
    c = @@subclasses[type]
    if c
      c.new
    else
      raise "y u do dis gooby"
    end
  end

  def self.register_flag (name)
    @@sublcasses[name] = self
  end

  def self.handle_flag (blerp, parser, data)
    # nop
  end

end

def define_flag (name, desc, superclass=OptionFlag, &block)
  c = Class.new(superclass, &block)
  c.register_flag(name)
  Object.const_set("#{name.to_s.capitalize}OptionFlag", c)
end
