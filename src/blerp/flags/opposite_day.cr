require "../flag.cr"

include Blerp

define_flag :opposite, "-O", "OPPOSITE DAY", do | parser, data |
  puts "opposite day"
end
