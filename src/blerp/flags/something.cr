require "../flag.cr"

class Execute < Blerp::Flag
  @name = :execute
  @key = "-e"
  @description = "EXECUTE SOMETHING"

  def process(parser, data)
    command = data.has_key?(:opposite) ? "nothing" : "something"
    output = MemoryIO.new
    Process.run(command, shell: true, output: output, error: output)
    output.close
    data[:output].as(Array(String)) << output.to_s
  end
end

Blerp::Flag.register Execute.new
