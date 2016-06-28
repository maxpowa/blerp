require "./blerp/**"

module Blerp
  #puts "#{Blerp::VERSION}"

  data = { } of Symbol => String | Array(String)
  data[:args] = ARGV
  data[:input] = ""
  data[:output] = [] of String

  parser = OptionParser.new

  parser.banner = "Usage: blerp [arguments]"

  Blerp::CommandFlag.flags.each do |key, val|
    parser.on(val.key, val.desc) {
      val.handle_flag(parser, data)
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

  data[:output].as(Array(String)).each do |line|
    puts line
  end

  #puts parser

  #puts "#{Blerp::CommandFlag.flags}"
end
