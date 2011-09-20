module Batik
  module ElementAttributes
    def coordinates(x, y)
      if type == 'circle'
        @attributes[:cx] = x
        @attributes[:cy] = y
      else
        @attributes[:x] = x
        @attributes[:y] = y
      end
    end

    def dimensions(width, height)
      @attributes[:width] = width
      @attributes[:height] = height
    end

    def color(options = {})
      @attributes[:fill] = options[:fill] if options[:fill]
      @attributes[:stroke] = options[:stroke] if options[:stroke]
    end
  end
end
