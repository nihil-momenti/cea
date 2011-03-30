puts <<END
+=======================================================================+
| Error: Colorize gem not available, falling back to uncoloured output. |
| See README.md for details.                                            |
+=======================================================================+
END

class String
  def colorize( params ); self end
  def uncolorize; self end
  def colorized?; self end

  [
    :black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :light_black, :light_red,
    :light_green, :light_yellow, :light_blue, :light_magenta, :light_cyan, :light_white
  ].each do |key|
    define_method(key)         { self }
    define_method("on_#{key}") { self }
  end

  [ :underline, :blink, :swap, :hide ].each { |key| define_method(key) { self } }

  class << self
    def modes; end
    def colors; end 
    def color_matrix; end
  end
end
