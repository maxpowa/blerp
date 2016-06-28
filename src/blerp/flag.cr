require "option_parser"

module Blerp

  class CommandFlag

    @@flags = { } of Symbol => CommandFlag

    def self.flags
      @@flags
    end

    # Actual OptionFlag methods

    def initialize (name : Symbol, key : String, desc : String, &block : OptionParser, Hash(Symbol, String) ->)
      @name = name
      @key = key
      @desc = desc
      @handler = block
      @@flags[name] = self
    end

    def name
      "#{@name.to_s.capitalize}CommandFlag"
    end

    def key
      @key
    end

    def desc
      @desc
    end

    # Call the handler block
    def handle_flag (parser, data)
      @handler.call parser, data
    end

  end

  def define_flag (name, key, desc, &block : OptionParser, Hash(Symbol, String) ->)
    CommandFlag.new name, key, desc, &block
  end

end
