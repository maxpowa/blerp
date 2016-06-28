require "option_parser"

module Blerp

  abstract class Flag

    @@flags = { } of Symbol => Flag

    def self.flags
      @@flags
    end

    def self.register(instance)
      @@flags[instance.name] = instance
    end

    macro inherited
      getter name : Symbol
      getter key : String
      getter description : String
    end

    def process(parser, data)
      # optional implementation
    end

    def preprocess(parser, data)
      # optional implementation
    end

    def postprocess(parser, data)
      # optional implementation
    end

  end

end
