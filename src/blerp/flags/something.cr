require "../flag.cr"

include Blerp

define_flag :execute, "-e", "EXECUTE SOMETHING", do | parser, data |
  command = data.has_key?(:opposite) ? "nothing" : "something"
  output = MemoryIO.new
  Process.run(command, shell: true, output: output, error: output)
  output.close
  data[:output].as(Array(String)) << output.to_s
end
