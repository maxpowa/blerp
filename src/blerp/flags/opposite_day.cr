require "../flag.cr"

include Blerp

define_flag :opposite, "-O", "OPPOSITE DAY", do | parser, data |
  data[:opposite] = "true"
end
