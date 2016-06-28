require "../flag.cr"

class Opposite < Blerp::Flag
  @name = :opposite
  @key = "-O"
  @description = "OPPOSITE DAY"

  def process(parser, data)
    data[self.name] = "true"
  end
end

Blerp::Flag.register Opposite.new
