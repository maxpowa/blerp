require "./blerp/**"

module Blerp
  #puts "#{Blerp::VERSION}"

  data = { } of Symbol => String | Array(String) | Array(Symbol)
  data[:args] = ARGV
  data[:input] = ""
  data[:output] = [] of String
  data[:processed_flags] = [] of Symbol

  data[:output].as(Array(String)) << "bees"

  parser = OptionParser.new

  parser.banner = "Usage:\tblerp {[OPTION|ARGS]...[ARGS...-f [FLAGS]...}\n\tblerp {...DIRECTORY...URL|BLERP} OPTIONS]-{}"

  Blerp::Flag.flags.each do |name, flag|
    # Do any required preprocessing
    flag.preprocess(parser, data)

    # And add the option parser flag
    parser.on(flag.key, flag.description) {
      flag.process(parser, data)
      data[:processed_flags].as(Array(Symbol)) << flag.name
    }
  end

  parser.unknown_args do | arr, arr2 |
    #puts "#{arr} #{arr2}"
  end

  begin
    parser.parse data[:args].as(Array(String))
  rescue ex : OptionParser::InvalidOption
    # nop
  end

  Blerp::Flag.flags.each do |name, flag|
    if data[:processed_flags].as(Array(Symbol)).includes?(name)
      flag.postprocess(parser, data)
    end
  end

  data[:output].as(Array(String)).each do |line|
    puts line
  end

end
