require "../flag.cr"

register_flag "-O", "OPPOSITE DAY" do
  def handle_flag (blerp, parser, data)
    puts "opposite day"
  end
end
