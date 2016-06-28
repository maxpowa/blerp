require "./blerp/**"

module Blerp
  #puts "#{Blerp::VERSION}"

  data = { } of Symbol => String
  data[:input] = ""
  data[:output] = ""

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
    parser.parse!
  rescue ex : OptionParser::InvalidOption
    # nop
  end

  #puts parser

  #puts "#{Blerp::CommandFlag.flags}"
end
