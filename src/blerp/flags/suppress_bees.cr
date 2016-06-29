require "../flag.cr"

class SuppressBees < Blerp::Flag
  @name = :bees
  @key = "-b"
  @description = "SUPPRESS BEES"

  def postprocess(parser, data)
    data[:output].as(Array(String)).map! { |line|
      line.gsub { |char|
        if !"BbʙᴮᵇḂḃḄḅḆḇℬ⒝ⒷⓑＢｂ𝐁𝐛𝐵𝑏𝑩𝒃𝒷𝓑𝓫𝔅𝔟𝔹𝕓𝕭𝖇𝖡𝖻𝗕𝗯𝘉𝘣𝘽𝙗𝙱𝚋🐝".includes? char
          char
        elsif data.has_key?(:opposite)
          '🐝'
        end
      }
    }
  end
end

Blerp::Flag.register SuppressBees.new
